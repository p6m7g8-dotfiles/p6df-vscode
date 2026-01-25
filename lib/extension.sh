# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::vscode::extension::install(extension_id)
#
#  Args:
#	extension_id -
#
#>
######################################################################
p6df::modules::vscode::extension::install() {
  local extension_id="$1"

  # use p6df::modules::vscode::sandbox::runner
  p6df::modules::vscode::sandbox::runner --install-extension "$extension_id"

  p6_return_void
}
