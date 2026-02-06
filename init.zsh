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
  p6df::modules::vscode::extension::install bierner.markdown-preview-github-styles    # markdown-preview-github-styles colorTheme: "auto" || GitHub-styled markdown preview
  p6df::modules::vscode::extension::install shd101wyy.markdown-preview-enhanced       # markdown-preview-enhanced.enablePreview: true || Enhanced markdown preview and export
  p6df::modules::vscode::extension::install yzane.markdown-pdf                        # markdown-pdf.outputDirectory: "" || Export markdown to PDF/HTML/PNG
  p6df::modules::vscode::extension::install yzhang.markdown-all-in-one                # [markdown].editor.defaultFormatter: "yzhang.markdown-all-in-one" || Markdown editing helpers and formatter

  # yaml
  p6df::modules::vscode::extension::install redhat.vscode-yaml                        # yaml.format.enable: true || YAML validation and formatting

  # ui
  p6df::modules::vscode::extension::install aaron-bond.better-comments                # better-comments.tags: [] || Highlight TODO/FIXME/NOTE comment tags
  p6df::modules::vscode::extension::install alefragnani.Bookmarks                     # bookmarks.useWorkplaceBookmarks: true || Toggle and list bookmarks in files
  p6df::modules::vscode::extension::install christian-kohler.path-intellisense        # path-intellisense.extensionOnImport: true || Path completion in strings/imports
  p6df::modules::vscode::extension::install lfs.vscode-emacs-friendly                 # emacsFriendly.all: true || Emacs-like keybindings and behaviors
  p6df::modules::vscode::extension::install naumovs.color-highlight                   # color-highlight.markerType: "dot" || Inline color previews
  p6df::modules::vscode::extension::install shardulm94.trailing-spaces                # trailing-spaces.trimOnSave: true || Highlight and trim trailing whitespace
  p6df::modules::vscode::extension::install streetsidesoftware.code-spell-checker     # cSpell.enabled: true || Spell checking in code and text
  p6df::modules::vscode::extension::install v4run.transpose                           # transpose.rotate: true || Swap/transpose words or characters
  p6df::modules::vscode::extension::install wmaurer.change-case                       # changeCase.locale: "en-US" || Convert text casing

  # community/publishing
  p6df::modules::vscode::extension::install MS-vsliveshare.vsliveshare                # liveshare.presence: true || Collaborative coding sessions
  p6df::modules::vscode::extension::install ritwickdey.LiveServer                     # liveServer.settings.CustomBrowser: "chrome" || Local dev server with live reload
  p6df::modules::vscode::extension::install sneezry.vscode-devto                      # devto.token: "" || Publish to dev.to from VS Code

  # misc
  p6df::modules::vscode::extension::install arcanis.vscode-zipfs                      # zipfs.enable: true || Browse zip archives as folders
  p6df::modules::vscode::extension::install hbenl.vscode-test-explorer                # testExplorer.on: true || Unified test explorer UI
  p6df::modules::vscode::extension::install jebbs.plantuml                            # plantuml.render: "local" || Render UML diagrams
  p6df::modules::vscode::extension::install ms-vscode.test-adapter-converter          # testAdapter.converter.enabled: true || Bridge old test adapters
  p6df::modules::vscode::extension::install redhat.vscode-commons                     # redhat.telemetry.enabled: false || Shared Red Hat extension utilities
  p6df::modules::vscode::extension::install ryu1kn.partial-diff                       # partialDiff.enableTelemetry: false || Compare selections or clipboard

  #  p6df::modules::vscode::extension::install thundra.thundra-debugger
  #  p6df::modules::vscode::extension::install Tyriar.lorem-ipsu

  p6_return_void
}
######################################################################
#<
#
# Function: p6df::modules::vscode::vscodes::config()
#
#>
######################################################################
p6df::modules::vscode::vscodes::config() {

  cat <<'EOF'
    "[jsonc]": {
      "editor.defaultFormatter": "vscode.json-language-features"
    },
    "editor.cursorBlinking": "phase",
    "editor.cursorStyle": "block",
    "editor.formatOnPaste": true,
    "editor.formatOnType": true,
    "editor.minimap.enabled": false,
    "editor.snippetSuggestions": "top",
    "editor.suggest.preview": true,
    "editor.tabCompletion": "on",
    "editor.wordWrap": "all",
    "editor.wordWrapColumn": 120,
    "editor.renderWhitespace": "boundary",
    "editor.quickSuggestions": {
      "strings": true
    },
    "liveServer.settings.CustomBrowser": "chrome",
    "liveServer.settings.donotShowInfoMsg": true,
    "redhat.telemetry.enabled": false,
    "security.workspace.trust.untrustedFiles": "open",
    "telemetry.telemetryLevel": "off",
    "terminal.integrated.copyOnSelection": true,
    "terminal.integrated.cursorBlinking": true,
    "terminal.integrated.scrollback": 100000,
    "terminal.integrated.shellIntegration.history": 10000,
    "trailing-spaces.trimOnSave": true,
    "workbench.colorTheme": "Default Dark+",
    "workbench.startupEditor": "none",
    "[markdown]": {
      "editor.defaultFormatter": "yzhang.markdown-all-in-one"
    }
EOF

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::vscode::init(_module, dir)
#
#  Args:
#	_module -
#	dir -
#
#>
######################################################################
p6df::modules::vscode::init() {
  local _module="$1"
  local dir="$2"

  p6_bootstrap "$dir"

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

  p6_alias "p6_code" "p6df::modules::vscode::sandbox::runner"
  p6_alias "cde" "p6_code"
  p6_alias "cdel" "cde --list-extensions"
  p6_alias "cdei" "p6df::modules::vscode::extension::install"

  p6_alias "scde"  "p6df::modules::vscode::sandbox::select shell; cde"
  p6_alias "pycde" "p6df::modules::vscode::sandbox::select python; cde"
  p6_alias "rucde" "p6df::modules::vscode::sandbox::select rust; cde"
  p6_alias "gcde"  "p6df::modules::vscode::sandbox::select go; cde"
  p6_alias "ncde"  "p6df::modules::vscode::sandbox::select nextjs; cde"
  p6_alias "rcde"  "p6df::modules::vscode::sandbox::select rails; cde"
  p6_alias "ccde"  "p6df::modules::vscode::sandbox::select cdk; cde"

  p6_alias "code" "p6_code"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::vscode::langs()
#
#  Environment:	 P6_DFZ_VSCODE_SANDBOX_NAME
#>
######################################################################
p6df::modules::vscode::langs() {

  p6df::modules::vscode::sandbox::create shell    "Default Dark+"       vscode shell github
  p6df::modules::vscode::sandbox::create python   "iDefault Light+"     vscode shell github python
  p6df::modules::vscode::sandbox::create rust     "Red"                 vscode shell github rust
  p6df::modules::vscode::sandbox::create go       "Tomorrow Night Blue" vscode shell github go
  p6df::modules::vscode::sandbox::create nextjs   "Abyss"               vscode shell github eslint js playwright
  p6df::modules::vscode::sandbox::create rails    "Solarized Dark"      vscode shell github ruby rails
  p6df::modules::vscode::sandbox::create cdk      "Kimbie Dark"         vscode shell github aws js

  p6_env_export_un "P6_DFZ_VSCODE_SANDBOX_NAME"

  p6_return_void
}

######################################################################
#<
#
# Function: str str = p6df::modules::vscode::prompt::mod()
#
#  Returns:
#	str - str
#
#  Environment:	 P6_DFZ_PROFILE_VSCODE P6_DFZ_VSCODE_SANDBOX_NAME
#>
######################################################################
p6df::modules::vscode::prompt::mod() {

  local str
  if p6_string_blank_NOT "$P6_DFZ_VSCODE_SANDBOX_NAME"; then
    str="vscode:\t\t  $P6_DFZ_PROFILE_VSCODE: $P6_DFZ_VSCODE_SANDBOX_NAME"
  fi

  p6_return_str "$str"
}

# shellcheck disable=2329
######################################################################
#<
#
# Function: p6df::modules::vscode::profile::on(profile)
#
#  Args:
#	profile -
#
#  Environment:	 HOME P6_DFZ_PROFILE_VSCODE P6_DFZ_VSCODE_SANDBOX_DIR
#>
######################################################################
p6df::modules::vscode::profile::on() {
  local profile="$1"

  p6_env_export "P6_DFZ_VSCODE_SANDBOX_DIR" "$HOME/.vscode-sandboxes"

  p6_env_export "P6_DFZ_PROFILE_VSCODE" "$profile"

  p6_return_void
}

# shellcheck disable=2329
######################################################################
#<
#
# Function: p6df::modules::vscode::profile::off()
#
#  Environment:	 P6_DFZ_PROFILE_VSCODE P6_DFZ_VSCODE_SANDBOX_DIR P6_DFZ_VSCODE_SANDBOX_NAME
#>
######################################################################
p6df::modules::vscode::profile::off() {

  p6_env_export_un P6_DFZ_PROFILE_VSCODE
  p6_env_export_un P6_DFZ_VSCODE_SANDBOX_DIR
  p6_env_export_un P6_DFZ_VSCODE_SANDBOX_NAME

  p6_return_void
}
