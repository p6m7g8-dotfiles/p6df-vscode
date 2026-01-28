# shellcheck shell=bash

######################################################################
#<
#
# Function: p6df::modules::vscode::sandboxes::init()
#
#  Environment:	 P6_DFZ_VSCODE_SANDBOX_DIR
#>
######################################################################
p6df::modules::vscode::sandboxes::init() {

  p6_dir_mk "$P6_DFZ_VSCODE_SANDBOX_DIR"

  p6_return_void
}
