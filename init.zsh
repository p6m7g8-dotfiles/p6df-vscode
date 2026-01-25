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
  p6df::modules::vscode::extension::install bierner.markdown-preview-github-styles
  p6df::modules::vscode::extension::install shd101wyy.markdown-preview-enhanced
  p6df::modules::vscode::extension::install yzane.markdown-pdf
  p6df::modules::vscode::extension::install yzhang.markdown-all-in-one

  # yaml
  p6df::modules::vscode::extension::install redhat.vscode-yaml

  # ui
  p6df::modules::vscode::extension::install aaron-bond.better-comments
  p6df::modules::vscode::extension::install alefragnani.Bookmarks
  p6df::modules::vscode::extension::install christian-kohler.path-intellisense
  p6df::modules::vscode::extension::install lfs.vscode-emacs-friendly
  p6df::modules::vscode::extension::install naumovs.color-highlight
  p6df::modules::vscode::extension::install shardulm94.trailing-spaces
  p6df::modules::vscode::extension::install streetsidesoftware.code-spell-checker
  p6df::modules::vscode::extension::install v4run.transpose
  p6df::modules::vscode::extension::install VisualStudioExptTeam.vscodeintellicode
  p6df::modules::vscode::extension::install wmaurer.change-case

  # community/publishing
  p6df::modules::vscode::extension::install MS-vsliveshare.vsliveshare
  p6df::modules::vscode::extension::install ritwickdey.LiveServer
  p6df::modules::vscode::extension::install sneezry.vscode-devto

  # misc
  p6df::modules::vscode::extension::install arcanis.vscode-zipfs
  p6df::modules::vscode::extension::install esbenp.prettier-vscode
  p6df::modules::vscode::extension::install hbenl.vscode-test-explorer
  p6df::modules::vscode::extension::install jebbs.plantuml
  p6df::modules::vscode::extension::install VisualStudioExptTeam.intellicode-api-usage-examples
  p6df::modules::vscode::extension::install ms-vscode.test-adapter-converter
  p6df::modules::vscode::extension::install redhat.vscode-commons
  p6df::modules::vscode::extension::install ryu1kn.partial-diff

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
  "breadcrumbs.enabled": true,
  "css.validate": false,
  "editor.bracketPairColorization.enabled": true,
  "editor.cursorBlinking": "phase",
  "editor.cursorStyle": "block",
  "editor.formatOnPaste": true,
  "editor.formatOnSave": false,
  "editor.formatOnSaveMode": "file",
  "editor.formatOnType": true,
  "editor.inlineSuggest.enabled": true,
  "editor.minimap.enabled": false,
  "editor.snippetSuggestions": "top",
  "editor.suggest.preview": true,
  "editor.suggest.showMethods": true,
  "editor.suggestSelection": "first",
  "editor.tabCompletion": "on",
  "editor.acceptSuggestionOnEnter": "on",
  "editor.renderWhitespace": "boundary",
  "editor.quickSuggestions": {
    "strings": true
  },
  "security.workspace.trust.untrustedFiles": "open",
  "telemetry.telemetryLevel": "off",
  "redhat.telemetry.enabled": false,
  "terminal.integrated.profiles.osx": {
    "zsh": {
      "path": "/opt/homebrew/bin/zsh",
      "args": ["-l"]
    }
  },
  "terminal.integrated.copyOnSelection": true,
  "terminal.integrated.cursorBlinking": true,
  "terminal.integrated.cursorStyle": "block",
  "terminal.integrated.environmentChangesIndicator": "warnonly",
  "terminal.integrated.scrollback": 100000,
  "terminal.integrated.shellIntegration.history": 10000,
  "workbench.colorTheme": "Default Dark+",
  "workbench.startupEditor": "none",
  "workbench.editorAssociations": {
    "*.ipynb": "jupyter-notebook"
  },
  "remote.SSH.remotePlatform": {
    "*.gitpod.io": "linux"
  },
  "errorLens.enabledDiagnosticLevels": ["error", "warning"],
  "errorLens.excludeBySource": ["cSpell"],
  "cSpell.userWords": ["awscdk"],
  "liveServer.settings.CustomBrowser": "chrome",
  "liveServer.settings.donotShowInfoMsg": true,
  "http.systemCertificatesNode": true,
  "sonarlint.pathToNodeExecutable": "node",
  "[markdown]": {
    "editor.defaultFormatter": "yzhang.markdown-all-in-one"
  },
  "[jsonc]": {
    "editor.defaultFormatter": "vscode.json-language-features"
  },
  "[yaml]": {
    "editor.defaultFormatter": "redhat.vscode-yaml"
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
# shellcheck disable=2329
p6df::modules::vscode::profile::on() {
  local profile="$1"

  p6_env_export "P6_DFZ_VSCODE_SANDBOX_DIR" "$HOME/.vscode-sandboxes"

  p6_env_export "P6_DFZ_PROFILE_VSCODE" "$profile"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::vscode::profile::off()
#
#  Environment:	 P6_DFZ_PROFILE_VSCODE P6_DFZ_VSCODE_SANDBOX_DIR P6_DFZ_VSCODE_SANDBOX_NAME
#>
######################################################################
# shellcheck disable=2329
p6df::modules::vscode::profile::off() {

  p6_env_export_un P6_DFZ_PROFILE_VSCODE
  p6_env_export_un P6_DFZ_VSCODE_SANDBOX_DIR
  p6_env_export_un P6_DFZ_VSCODE_SANDBOX_NAME

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::vscode::profile::on(profile)
#
#  Args:
#	profile -
#
#  Environment:	 P6_DFZ_PROFILE_VSCODE
#>
######################################################################
p6df::modules::vscode::profile::on() {
  local profile="$1"

  p6_env_export "P6_DFZ_PROFILE_VSCODE" "$profile"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::vscode::profile::off()
#
#  Environment:	 P6_DFZ_PROFILE_VSCODE
#>
######################################################################
p6df::modules::vscode::profile::off() {

  p6_env_export_un P6_DFZ_PROFILE_VSCODE

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::vscode::settings::generate()
#
#  Environment:	 P6_DFZ_SRC_P6M7G8_DOTFILES_DIR
#>
######################################################################
p6df::modules::vscode::settings::generate() {

  local output_file="$P6_DFZ_SRC_P6M7G8_DOTFILES_DIR/p6df-vscode/share/settings.json"

  # Collect all config snippets
  local merged
  merged=$(p6df::modules::vscode::settings::collect)

  # Write formatted JSON
  p6_echo "$merged" | jq '.' > "$output_file"

  p6_msg "Generated: $output_file"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::vscode::settings::collect()
#
#  Environment:	 P6_DFZ_MODULES
#>
######################################################################
p6df::modules::vscode::settings::collect() {

  local merged="{}"

  # Iterate through all loaded modules
  local module
  for module in $(p6_vertical "$P6_DFZ_MODULES"); do
    local snippet=$(p6df::modules::vscode::settings::module::config "$module")

    if ! p6_string_blank "$snippet"; then
      # Deep merge using jq
      merged=$(p6_echo "$merged" | jq -s --argjson new "{$snippet}" '.[0] * $new')
    fi
  done

  p6_echo "$merged"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::vscode::settings::module::config(module)
#
#  Args:
#	module -
#
#  Environment:	 P6_DFZ_SRC_DIR
#>
######################################################################
p6df::modules::vscode::settings::module::config() {
  local module="$1"

  local dir="$P6_DFZ_SRC_DIR/$module"

  # Parse module to get function prefix
  # %repo
  p6df::core::module::parse "$module" "$dir"
  # shellcheck disable=1087,2125,2154
  local prefix=$repo[prefix]
  unset repo

  # Construct config function name
  local config_func="${prefix}::vscodes::config"

  # Check if function exists and call it
  if type -f "$config_func" >/dev/null 2>&1; then
    $config_func
  fi

  p6_return_void
}
