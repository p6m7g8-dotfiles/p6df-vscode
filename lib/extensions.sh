# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::vscode::extensions::create(...)
#
#  Args:
#	... - 
#
#>
######################################################################
p6df::modules::vscode::extensions::create() {
  shift 0

  for module in "$@"; do
    if type "p6df::modules::${module}::vscodes" >/dev/null 2>&1; then
      p6df::modules::"${module}"::vscodes
    fi
  done

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::vscode::extensions::list()
#
#>
######################################################################
p6df::modules::vscode::extensions::list() {

  p6df::modules::vscode::sandbox::runner --list-extensions

  p6_return_void
}
