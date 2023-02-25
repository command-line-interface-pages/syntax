# Supported syntax

## Page summary

### Tags

#### List like tags

> :bell: Compatibility note: `or` is not supported for list like tags.

The following list like tags are supported:

- `syntax-compatible: [<command1>, <command2>, ...]`: syntax compatible command
  array  
  **type**: array of string  
  **required**: false  
  **default**: []  
  **unique items**: true  
  **example**:

  ```yaml
  summary:
      syntax-compatible: [sh]
  ```

  **note**: Command `<first-command>` considered syntax compatible with command
  `<second-command>` when `<first-command>` support all syntax that `<second-command>` does.
  It doesn't matter whether this happens by default or by enabling some emulation
  mode like in `Zsh`. Deprecated syntax construct doesn't count while comparing
  syntax compatibility.

- `help: [<flag1>, <flag2>, ...]`: help flag command array  
  **type**: array of string  
  **required**: false  
  **default**: []  
  **unique items**: true  
  **example**:

  ```yaml
  summary:
      help: [--help, -h]
  ```

- `version: [<flag1>, <flag2>, ...]`: version flag command array  
  **type**: array of string  
  **required**: false  
  **default**: []  
  **unique items**: true  
  **example**:

  ```yaml
  summary:
      help: [--help, -h]
  ```
