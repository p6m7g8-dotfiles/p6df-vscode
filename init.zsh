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

#    "editor.wordWrap": "all",
#    "editor.wordWrapColumn": 120,
  cat <<'EOF'
    "[markdown]": {
      "editor.defaultFormatter": "yzhang.markdown-all-in-one"
    },
    "[jsonc]": {
      "editor.defaultFormatter": "vscode.json-language-features"
    },
    "[yaml]": {
      "editor.defaultFormatter": "redhat.vscode-yaml"
    },
    "editor.cursorBlinking": "phase",
    "editor.cursorStyle": "block",
    "editor.formatOnPaste": true,
    "editor.formatOnSave": true,
    "editor.formatOnType": true,
    "editor.minimap.enabled": false,
    "editor.snippetSuggestions": "top",
    "editor.suggest.preview": true,
    "editor.tabCompletion": "on",
    "editor.tabSize": 2,
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
    "workbench.startupEditor": "none"
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
  p6_alias "cdel" "p6df::modules::vscode::extensions::list"
  p6_alias "cdeL" "p6df::modules::vscode::extension::install"

  p6_alias "acde"  "p6df::modules::vscode::sandbox::select all;    p6df::modules::vscode::sandbox::runner"
  p6_alias "ccde"  "p6df::modules::vscode::sandbox::select cdk;    p6df::modules::vscode::sandbox::runner"
  p6_alias "srcde" "p6df::modules::vscode::sandbox::select sre;    p6df::modules::vscode::sandbox::runner"
  p6_alias "gcde"  "p6df::modules::vscode::sandbox::select go;     p6df::modules::vscode::sandbox::runner"
  p6_alias "jcde"  "p6df::modules::vscode::sandbox::select java;   p6df::modules::vscode::sandbox::runner"
  p6_alias "ncde"  "p6df::modules::vscode::sandbox::select nextjs; p6df::modules::vscode::sandbox::runner"
  p6_alias "ppcde" "p6df::modules::vscode::sandbox::select perl;   p6df::modules::vscode::sandbox::runner"
  p6_alias "pycde" "p6df::modules::vscode::sandbox::select python; p6df::modules::vscode::sandbox::runner"
  p6_alias "rcde"  "p6df::modules::vscode::sandbox::select rails;  p6df::modules::vscode::sandbox::runner"
  p6_alias "rucde" "p6df::modules::vscode::sandbox::select rust;   p6df::modules::vscode::sandbox::runner"
  p6_alias "scde"  "p6df::modules::vscode::sandbox::select shell;  p6df::modules::vscode::sandbox::runner"

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

  # TODO: gemini, copilot, claudecode

  p6df::modules::vscode::sandbox::create cdk      "Kimbie Dark"         vscode shell git github aws eslint js playwright
  p6df::modules::vscode::sandbox::create go       "Tomorrow Night Blue" vscode shell git github go
  p6df::modules::vscode::sandbox::create java     "Monokai Dimmed"      vscode shell git github java
  p6df::modules::vscode::sandbox::create nextjs   "Abyss"               vscode shell git github eslint js playwright
  p6df::modules::vscode::sandbox::create perl     "Experimental Dark"   vscode shell git github perl
  p6df::modules::vscode::sandbox::create python   "Default Light+"      vscode shell git github python
  p6df::modules::vscode::sandbox::create rails    "Solarized Dark"      vscode shell git github ruby rails
  p6df::modules::vscode::sandbox::create rust     "Red"                 vscode shell git github rust
  p6df::modules::vscode::sandbox::create shell    "Default Dark+"       vscode shell git github
  p6df::modules::vscode::sandbox::create sre      "Solarized Light"     vscode shell git github docker jenkins launchdarkly kubernetes terraform

  p6df::modules::vscode::sandbox::create all      "Visual Studio Light" aws c cucumber docker eslint git github go java js jupyter perl playwright python ruby rust shell snowflake terraform vscode

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
