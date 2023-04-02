# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::vscode::deps()
#
#>
######################################################################
p6df::modules::vscode::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6df-shell
  )
}

######################################################################
#<
#
# Function: p6df::modules::vscode::vscodes()
#
#>
######################################################################
p6df::modules::vscode::vscodes() {

  # md
  code --install-extension bierner.markdown-preview-github-styles
  code --install-extension shd101wyy.markdown-preview-enhanced
  code --install-extension yzane.markdown-pdf
  code --install-extension yzhang.markdown-all-in-one

  # yaml
  code --install-extension redhat.vscode-yaml

  # ui
  code --install-extension aaron-bond.better-comments
  code --install-extension alefragnani.Bookmarks
  code --install-extension bibhasdn.unique-lines
  code --install-extension christian-kohler.path-intellisense
  code --install-extension lfs.vscode-emacs-friendly
  code --install-extension naumovs.color-highlight
  code --install-extension shardulm94.trailing-spaces
  code --install-extension streetsidesoftware.code-spell-checker
  code --install-extension v4run.transpose
  code --install-extension VisualStudioExptTeam.vscodeintellicode
  code --install-extension wayou.vscode-todo-highlight
  code --install-extension wmaurer.change-case

  # community/publishing
  code --install-extension ms-vsliveshare.vsliveshare
  code --install-extension ms-vsliveshare.vsliveshare-pack
  code --install-extension ritwickdey.LiveServer
  code --install-extension sneezry.vscode-devto

  # misc
  code --install-extension arcanis.vscode-zipfs
  code --install-extension esbenp.prettier-vscode
  code --install-extension hbenl.vscode-test-explorer
  code --install-extension jebbs.plantuml
  code --install-extension thundra.thundra-debugger
  code --install-extension Tyriar.lorem-ipsu
  code --install-extension VisualStudioExptTeam.intellicode-api-usage-examples
  code --install-extension Wscats.cors-browser
  code --install-extensionms-vscode.test-adapter-converter
  code --install-extensionredhat.vscode-commons
  code --install-extensionryu1kn.partial-diff

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::vscode::external::brew()
#
#>
######################################################################
p6df::modules::vscode::external::brew() {

  brew install --cask visual-studio
  brew install --cask visual-studio-code
  brew install --cask visual-studio-code-insiders

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::vscode::home::symlink()
#
#  Environment:	 P6_DFZ_SRC_P6M7G8_DOTFILES_DIR
#>
######################################################################
p6df::modules::vscode::home::symlink() {

  ## fill in template
  p6_file_symlink "$P6_DFZ_SRC_P6M7G8_DOTFILES_DIR/p6df-vscode/share/settings.json" "$HOME/Library/Applications\ Support/Code/User/settings.json"
  p6_file_symlink "Library/Application\ Support/Code/User/globalStorage/.vscode" "."

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::vscode::aliases::init()
#
#>
######################################################################
p6df::modules::vscode::aliases::init() {

  alias p6_ca="p6_vscode_tmux_add"
  alias p6_cn="p6_vscode_new"

  p6_return_void
}

######################################################################
#<
#
# Function: code rc = p6_vscode_cmd(cmd, ...)
#
#  Args:
#	cmd -
#	... - 
#
#  Returns:
#	code - rc
#
#>
######################################################################
p6_vscode_cmd() {
  local cmd="$1"
  shift 1

  local log_type
  case $cmd in
  *) log_type=p6_run_write_cmd ;;
  esac

  p6_run_code "$log_type code $cmd $*"
  local rc=$?

  p6_return_code_as_code "$rc"
}

######################################################################
#<
#
# Function: p6_vscode_new([dir=.])
#
#  Args:
#	OPTIONAL dir - [.]
#
#>
######################################################################
p6_vscode_new() {
  local dir="${1:-.}"

  p6_vscode_cmd -n "$dir"
}

######################################################################
#<
#
# Function: p6_vscode_add([dir=.])
#
#  Args:
#	OPTIONAL dir - [.]
#
#>
######################################################################
p6_vscode_add() {
  local dir="${1:-.}"

  p6_vscode_cmd -a "$dir"
}

######################################################################
#<
#
# Function: p6_vscode_tmux_add()
#
#>
######################################################################
p6_vscode_tmux_add() {

  local session="vscode-$(pwd | md5)"
  p6_vscode_add "."
  p6df::modules::shell::tmux::make "$session"
}
