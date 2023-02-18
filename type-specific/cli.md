# Supported syntax

## Page summary

### Tags

#### List like tags

> :bell: Compatibility note: `or` is not supported for list like tags.

The following list like tags are supported:

- `Syntax compatible: <command1, command2, ...>`: comma-separated command list
  containing syntax compatible commands  
  :blue_book: **where**:
  - `<command1, command2, ...>` are commands
  
  :bulb: **examples**: `Syntax compatible: sh`  
  :pencil: **note** Command `<first>` considered syntax compatible with command
  `<second>` when `<first>` support all syntax that `<second>` does.
  It doesn't matter whether this happens by default or by enabling some emulation
  mode like in `Zsh`. Deprecated syntax construct doesn't count while comparing
  syntax compatibility.
- `Help: <flag1, flag2, ...>`: comma-separated help flag list
  for a generated code example  
  :blue_book: **where**:
  - `<flag1, flag2, ...>` are flags
  
  :bulb: **examples**: `Help: --help, -h`
- `Version: <flag1, flag2, ...>`: comma-separated version flag list
  for a generated code example  
  :blue_book: **where**:
  - `<flag1, flag2, ...>` are flags
  
  :bulb: **examples**: `Version: --version, -v`
