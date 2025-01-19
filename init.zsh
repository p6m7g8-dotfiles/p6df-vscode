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
  code --install-extension MS-vsliveshare.vsliveshare
  code --install-extension ritwickdey.LiveServer
  code --install-extension sneezry.vscode-devto

  # misc
  code --install-extension arcanis.vscode-zipfs
  code --install-extension esbenp.prettier-vscode
  code --install-extension hbenl.vscode-test-explorer
  code --install-extension jebbs.plantuml
  code --install-extension VisualStudioExptTeam.intellicode-api-usage-examples
  code --install-extension Wscats.cors-browser
  code --install-extension ms-vscode.test-adapter-converter
  code --install-extension redhat.vscode-commons
  code --install-extension ryu1kn.partial-diff

  #  code --install-extension thundra.thundra-debugger
  #  code --install-extension Tyriar.lorem-ipsu
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

  p6df::modules::homebrew::cli::brew::install --cask visual-studio-code
#  p6df::modules::homebrew::cli::brew::install --cask visual-studio-code@insiders

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
  p6_file_symlink "$P6_DFZ_SRC_P6M7G8_DOTFILES_DIR/p6df-vscode/share/settings.json" "$HOME/Library/Application\ Support/Code/User/settings.json"
  p6_file_symlink "Library/Application\ Support/Code/User/globalStorage/.vscode" "."

  p6_return_void
}
