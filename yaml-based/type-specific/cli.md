# Supported syntax

## Page summary (`summary`)

### Tags (`summary.<tag>`)

#### List like tags (`summary.<array-tag>`)

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
      version: [--version, -v]
  ```

## Code examples (`examples.<code-example>`)

Code examples are combinations of code descriptions and actual commands like:

```yaml
examples:
  Delay in [s]econds: "sleep ${seconds}s"
```

or:

```yaml
examples:
  Delay in [s]econds:
    code: sleep ${seconds}s
```

### Mnemonics (`examples.<code-example>.<mnemonic>`)

> :bookmark_tabs: Escape sequences: `\[`, `\]`.

Mnemonics are constructs used to refer to options or subcommands.

All mnemonics begin with a single opening square brace `[` and end with a
closing one `]`:

```md
<leading-word-characters>[<mnemonic-content>]<trailing-word-characters>
```

where:

- `<mnemonic-content>` is a command name, must contain at least one character
- `<leading-word-characters>` are term characters before a mnemonic, may be
  empty string
- `<trailing-word-characters>` are term characters after a mnemonic, may be
  empty string

like:

```md
[h]elp
```

When mnemonic is equal to the whole option or subcommand it looks like this:
`[help]`.

Spaces and pipe characters are not allowed inside square brackets.

### Placeholders (`examples.<code-example>[.code].<placeholder>`)

> :bell: Compatibility note: double braces are not used.  
> :bookmark_tabs: Escape sequences: `\$`.

Placeholders are constructs used to substitute some user entered data.

All placeholder begin with a single dollar sign followed by an opening curly
brace `{` and end with a closing one `}`:

```md
${<placeholder-content>}
```

where `<placeholder-content>` is some placeholder name like:

```md
${image}
```

#### Placeholder annotations (`examples.<code-example>.code.<annotation>`)

Placeholder annotations are constructs used to add constraints to placeholders
like:

```yaml
examples:
  Delay in [s]econds:
    code: sleep ${seconds}s
    annotations:
      seconds:
        type: integer
```

##### Singular value annotations (`examples.<code-example>.code.<annotation>.<singular-annotation>`)

The following singular value annotations are supported:

- `type: <type>`: value type  
  **type**: string  
  **required**: false  
  **default**: string  
  **values**: bool, int, float, char, string, command, subcommand, option, file, directory, path, any
  **example**:

  ```yaml
  examples:
    Display just a specific line:
      code: "sed ${option} '${line}p'"
      annotations:
        option:
          type: option
          values: [--silent, -n]
        line:
          type: int
          minimum: 1
  ```

- `minimum: <value>`: minimum value  
  **type**: int, float, char  
  **required**: false  
  **example**:

  ```yaml
  examples:
    Display just a specific line:
      code: "sed ${option} '${line}p'"
      annotations:
        option:
          type: option
          values: [--silent, -n]
        line:
          type: int
          minimum: 1
  ```

- `maximum: <value>`: maximum value  
  **type**: int, float, char  
  **required**: false  

- `repeat-minimum: <value>`: minimum amount of repetitions  
  **type**: int  
  **required**: false
  **default**: 0

- `repeat-maximum: <value>`: maximum amount of repetitions  
  **type**: int  
  **required**: false
  **default**: <infinity>

- `repeat-separator: <value>`: separator between repetitions  
  **type**: string  
  **required**: false
  **default**: <space>

  ```yaml
  examples:
    Execute a java program and use specific third-party or user-defined classes:
      code: java -classpath ${classes} ${class}
      annotations:
        classes:
          repeat-minimum: 1
          repeat-separator: ":"
  ```

##### List like annotations (`examples.<code-example>.code.<annotation>.<list-annotation>`)

The following list like annotations are supported:

- `examples: <type>`: value type
  array  
  **type**: array of <anything-except-array>  
  **required**: false  
  **default**: []  
  **example**:

  ```yaml
  examples:
    Display just a specific line:
      code: "sed ${option} '${line}p'"
      annotations:
        option:
          type: option
          values: [--silent, -n]
        line:
          type: int
          minimum: 1
          examples: [1]
  ```

- `extension-required: <boolean>`: whether a file/path extension is required  
  **type**: bool  
  **required**: false  
  **default**: false  
