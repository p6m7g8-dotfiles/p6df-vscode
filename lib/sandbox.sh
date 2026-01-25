# shellcheck shell=bash
######################################################################
#<
#
# Function: path dir = p6df::modules::vscode::sandbox::dir([sandbox_name])
#
#  Args:
#	OPTIONAL sandbox_name - defaults to P6_DFZ_VSCODE_SANDBOX_NAME
#
#  Returns:
#	path - dir
#
#  Environment:	 P6_DFZ_PROFILE_VSCODE P6_DFZ_VSCODE_SANDBOX_DIR P6_DFZ_VSCODE_SANDBOX_NAME
#>
######################################################################
p6df::modules::vscode::sandbox::dir() {
  local sandbox_name="${1:-$P6_DFZ_VSCODE_SANDBOX_NAME}"

  local dir="$P6_DFZ_VSCODE_SANDBOX_DIR/$P6_DFZ_PROFILE_VSCODE/$sandbox_name"

  p6_return_path "$dir"
}

######################################################################
#<
#
# Function: path dir = p6df::modules::vscode::sandbox::user_data_dir([sandbox_name])
#
#  Args:
#	OPTIONAL sandbox_name - defaults to P6_DFZ_VSCODE_SANDBOX_NAME
#
#  Returns:
#	path - dir
#
#  Environment:	 P6_DFZ_PROFILE_VSCODE P6_DFZ_VSCODE_SANDBOX_DIR P6_DFZ_VSCODE_SANDBOX_NAME
#>
######################################################################
p6df::modules::vscode::sandbox::user_data_dir() {
  local sandbox_name="${1:-$P6_DFZ_VSCODE_SANDBOX_NAME}"

  local dir=$(p6df::modules::vscode::sandbox::dir "$sandbox_name")

  p6_return_path "$dir"
}

######################################################################
#<
#
# Function: path dir = p6df::modules::vscode::sandbox::extensions_dir([sandbox_name])
#
#  Args:
#	OPTIONAL sandbox_name - defaults to P6_DFZ_VSCODE_SANDBOX_NAME
#
#  Returns:
#	path - dir
#
#  Environment:	 P6_DFZ_PROFILE_VSCODE P6_DFZ_VSCODE_SANDBOX_DIR P6_DFZ_VSCODE_SANDBOX_NAME
#>
######################################################################
p6df::modules::vscode::sandbox::extensions_dir() {
  local sandbox_name="${1:-$P6_DFZ_VSCODE_SANDBOX_NAME}"

  local dir=$(p6df::modules::vscode::sandbox::dir "$sandbox_name")

  p6_return_path "$dir"
}

######################################################################
#<
#
# Function: path file = p6df::modules::vscode::sandbox::settings_file([sandbox_name])
#
#  Args:
#	OPTIONAL sandbox_name - defaults to P6_DFZ_VSCODE_SANDBOX_NAME
#
#  Returns:
#	path - file
#
#  Environment:	 P6_DFZ_PROFILE_VSCODE P6_DFZ_VSCODE_SANDBOX_DIR P6_DFZ_VSCODE_SANDBOX_NAME
#>
######################################################################
p6df::modules::vscode::sandbox::settings_file() {
  local sandbox_name="${1:-$P6_DFZ_VSCODE_SANDBOX_NAME}"

  local user_dir=$(p6df::modules::vscode::sandbox::user_data_dir "$sandbox_name")
  local settings_file="$user_dir/User/settings.json"

  p6_return_path "$settings_file"
}

######################################################################
#<
#
# Function: str dir = p6df::modules::vscode::sandbox::create(sandbox_name, theme, modules...)
#
#  Args:
#	sandbox_name -
#	theme - REQUIRED
#	modules... - array of modules
#
#  Returns:
#	str - dir
#
#  Environment:	 P6_DFZ_PROFILE_VSCODE P6_DFZ_VSCODE_SANDBOX_DIR
#>
######################################################################
p6df::modules::vscode::sandbox::create() {
  local sandbox_name="$1"
  local theme="$2"
  shift 2

  local -a modules
  local module
  for module in "$@"; do
    modules+=("$module")
  done

  local dir="$(p6df::modules::vscode::sandbox::dir "$sandbox_name")"
  p6_dir_mk "$dir"
  p6_dir_mk "$dir/User"
  p6_dir_mk "$dir/extensions"

  # settings
  p6df::modules::vscode::settings::create "$sandbox_name" "$theme" "${modules[@]}"

  # extensions
  p6df::modules::vscode::extensions::create "${modules[@]}"

  p6_return_str "$dir"
}

######################################################################
#<
#
# Function: p6df::modules::vscode::sandbox::runner()
#
#  Environment:	 P6_DFZ_PROFILE_VSCODE P6_DFZ_VSCODE_SANDBOX_DIR P6_DFZ_VSCODE_SANDBOX_NAME
#>
######################################################################
p6df::modules::vscode::sandbox::runner() {

  local user_data_dir=$(p6df::modules::vscode::sandbox::user_data_dir)
  local extensions_dir=$(p6df::modules::vscode::sandbox::extensions_dir "$P6_DFZ_VSCODE_SANDBOX_NAME")

  code --user-data-dir "$user_data_dir" --extensions-dir "$extensions_dir" "$@"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::vscode::sandbox::select(sandbox_name)
#
#  Args:
#	sandbox_name -
#
#  Environment:	 P6_DFZ_VSCODE_SANDBOX_NAME
#>
######################################################################
p6df::modules::vscode::sandbox::select() {
  local sandbox_name="$1"

  p6_env_export "P6_DFZ_VSCODE_SANDBOX_NAME" "$sandbox_name"

  p6_return_void
}
