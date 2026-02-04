# P6's POSIX.2: p6df-vscode

## Table of Contents

- [Badges](#badges)
- [Summary](#summary)
- [Contributing](#contributing)
- [Code of Conduct](#code-of-conduct)
- [Usage](#usage)
  - [Aliases](#aliases)
  - [Functions](#functions)
- [Hierarchy](#hierarchy)
- [Author](#author)

## Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)

## Summary

TODO: Add a short summary of this module.

## Contributing

- [How to Contribute](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CONTRIBUTING.md>)

## Code of Conduct

- [Code of Conduct](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CODE_OF_CONDUCT.md>)

## Usage

### Aliases

- `cde` -> `p6_code`
- `cdei` -> `p6df::modules::vscode::extension::install`
- `cdel` -> `cde --list-extensions`
- `code` -> `p6_code`
- `p6_code` -> `p6df::modules::vscode::sandbox::runner`
- `pycde` -> `p6df::modules::vscode::sandbox::select python; cde`
- `rucde` -> `p6df::modules::vscode::sandbox::select rust; cde`

### Functions

#### p6df-vscode

##### p6df-vscode/init.zsh

- `p6df::modules::vscode::aliases::init()`
- `p6df::modules::vscode::deps()`
- `p6df::modules::vscode::init(_module, dir)`
  - Args:
    - _module - 
    - dir - 
- `p6df::modules::vscode::langs()`
- `p6df::modules::vscode::profile::off()`
- `p6df::modules::vscode::profile::on(profile)`
  - Args:
    - profile - 
- `p6df::modules::vscode::vscodes()`
- `p6df::modules::vscode::vscodes::config()`
- `str str = p6df::modules::vscode::prompt::mod()`

#### p6df-vscode/lib

##### p6df-vscode/lib/extension.sh

- `p6df::modules::vscode::extension::install(extension_id)`
  - Args:
    - extension_id - 

##### p6df-vscode/lib/extensions.sh

- `p6df::modules::vscode::extensions::create(...)`
  - Args:
    - ... - 

##### p6df-vscode/lib/sandbox.sh

- `p6df::modules::vscode::sandbox::runner(...)`
  - Args:
    - ... - 
- `p6df::modules::vscode::sandbox::select(sandbox_name)`
  - Args:
    - sandbox_name - 
- `path dir = p6df::modules::vscode::sandbox::dir([sandbox_name=$P6_DFZ_VSCODE_SANDBOX_NAME])`
  - Args:
    - OPTIONAL sandbox_name - [$P6_DFZ_VSCODE_SANDBOX_NAME]
- `path dir = p6df::modules::vscode::sandbox::extensions_dir([sandbox_name=$P6_DFZ_VSCODE_SANDBOX_NAME])`
  - Args:
    - OPTIONAL sandbox_name - [$P6_DFZ_VSCODE_SANDBOX_NAME]
- `path dir = p6df::modules::vscode::sandbox::user_data_dir([sandbox_name=$P6_DFZ_VSCODE_SANDBOX_NAME])`
  - Args:
    - OPTIONAL sandbox_name - [$P6_DFZ_VSCODE_SANDBOX_NAME]
- `path settings_file = p6df::modules::vscode::sandbox::settings_file([sandbox_name=$P6_DFZ_VSCODE_SANDBOX_NAME])`
  - Args:
    - OPTIONAL sandbox_name - [$P6_DFZ_VSCODE_SANDBOX_NAME]
- `str dir = p6df::modules::vscode::sandbox::create(sandbox_name, theme, ...)`
  - Args:
    - sandbox_name - 
    - theme - 
    - ... - 

##### p6df-vscode/lib/sandboxes.sh

- `p6df::modules::vscode::sandboxes::init()`

##### p6df-vscode/lib/settings.sh

- `p6df::modules::vscode::settings::create(sandbox_name, theme, ...)`
  - Args:
    - sandbox_name - 
    - theme - 
    - ... - 

## Hierarchy

```text
.
├── init.zsh
├── lib
│   ├── extension.sh
│   ├── extensions.sh
│   ├── sandbox.sh
│   ├── sandboxes.sh
│   └── settings.sh
└── README.md

2 directories, 7 files
```

## Author

Philip M. Gollucci <pgollucci@p6m7g8.com>
