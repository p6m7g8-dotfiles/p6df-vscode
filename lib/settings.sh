# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::vscode::settings::create(sandbox_name, theme, modules...)
#
#  Args:
#	sandbox_name -
#	theme - REQUIRED
#	modules... - array of modules
#
#>
######################################################################
p6df::modules::vscode::settings::create() {
  local sandbox_name="$1"
  local theme="$2"
  shift 2

  local settings_file=$(p6df::modules::vscode::sandbox::settings_file "$sandbox_name")

  local temp_dir=$(p6_transient_create "vscode-settings")

  # Add theme as base JSON object
  echo "{\"workbench.colorTheme\": \"$theme\"}" > "$temp_dir/000-theme.json"

  # Collect config from modules as separate JSON objects
  local i=1
  for module in "$@"; do
    if type "p6df::modules::${module}::vscodes::config" >/dev/null 2>&1; then
      local fragment=$(p6df::modules::"${module}"::vscodes::config | perl -0777 -pe 's/,\s*$//')
      echo "{$fragment}" > "$temp_dir/$(printf '%03d' $i)-${module}.json"
      ((i++))
    fi
  done

  # Merge all JSON objects using jq
  local formatted_json=$(jq -s 'add' "$temp_dir"/*.json 2>/dev/null | jq -S --indent 2 '.')
  p6_file_write "$settings_file" "$formatted_json"

  p6_transient_delete "$temp_dir"

  p6_return_void
}
