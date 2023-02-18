# Supported syntax

## Page summary

### Tags

#### List like tags

> :bell: Compatibility note: `or` is not supported for list like tags.

The following list like tags are supported:

- `Structure compatible: <directory1, directory2, ...>`: comma-separated directory
  containing structure compatible commands  
  :blue_book: **where**:
  - `<directory1, directory2, ...>` are commands
  
  :bulb: `Structure compatible: $HOME/bin`  
  :pencil: **note** Directory `<first>` considered structure compatible with
  directory `<second>` when `<first>` support all subdirectories that `<second>`
  does. Deprecated subdirectories doesn't count while comparing structure
  compatibility.
