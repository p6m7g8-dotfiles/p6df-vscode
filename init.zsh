# shellcheck shell=zsh

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
  code --install-extension sneezry.vscode-devto
  code --install-extension ms-vsliveshare.vsliveshare
  code --install-extension ms-vsliveshare.vsliveshare-pack
  code --install-extension ritwickdey.LiveServer

  # misc
  code --install-extension arcanis.vscode-zipfs
  code --install-extension esbenp.prettier-vscode
  code --install-extension hbenl.vscode-test-explorer
  code --install-extension thundra.thundra-debugger
  code --install-extension Wscats.cors-browser
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
}

######################################################################
#<
#
# Function: p6df::modules::vscode::home::symlink()
#
#  Environment:	 P6_DFZ_SRC_P6M7G8_DIR
#>
######################################################################
p6df::modules::vscode::home::symlink() {

  ## fill in template
  ln -fs $P6_DFZ_SRC_P6M7G8_DOTFILES_DIR/p6df-vscode/share/settings.json $HOME/Library/Applications\ Support/Code/User/settings.json
  ln -fs Library/Application\ Support/Code/User/globalStorage/.vscode .
}

######################################################################
#<
#
# Function: p6df::modules::vscode::init()
#
#>
######################################################################
p6df::modules::vscode::init() {

  p6df::modules::vscode::aliases::init
}

######################################################################
#<
#
# Function: p6df::modules::vscode::aliases::init()
#
#  Depends:	 p6_ca p6_cn
#>
######################################################################
p6df::modules::vscode::aliases::init() {

  alias p6_ca="p6_vscode_tmux_add"
  alias p6_cn="p6_vscode_new"
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
#  Depends:	 p6_run
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
