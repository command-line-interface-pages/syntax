# Supported syntax

## Page summary (`summary`)

### Tags (`summary.<tag>`)

#### List like tags (`summary.<array-tag>`)

The following list like tags are supported:

- `syntax-compatible`: syntax compatible commands
  array  
  **type**: *array of string*  
  **required**: *false*  
  **default**: *[]*  
  **unique items**: *true*  
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

- `help`: help flags  
  **type**: *array of string*  
  **required**: *false*  
  **default**: *[]*  
  **unique items**: *true*  
  **example**:

  ```yaml
  summary:
      help: [--help, -h]
  ```

- `version`: version flags  
  **type**: *array of string*  
  **required**: *false*  
  **default**: *[]*  
  **unique items**: *true*  
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

### Alternatives (`examples.<code-example>.<alternative>`)

Alternatives are constructs used to describe options or subcommands where more 2
or more choices available.

> :bookmark_tabs: Escape sequences: `\(`, `\)`.

All alternatives begin with a single opening parenthesis `(` and end with a
closing one `)`:

```md
(<alternative-content1>|<alternative-content2>|...)
```

where `<alternative-contentX>` (where `X` is some number) is an option or
subcommand description like:

```yaml
examples:
  Test if a specific variable is (equal|not equal) to a string:
    code: '[ "$${first-variable}" ${operator} "${value}" ]'
    annotations:
      operator:
        type: string
        values: ["==", "!="]
        alternative: true
```

where `equal` matches `==` and `not equal` `!=` respectively. Alternative
choices in code description must match value count inside a placeholder `values` and
`alternative` should be set to true. Several placeholders can't satisfy
described conditions at once. No more than one alternative can be defined per
code example.

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

- `type`: placeholder value type  
  **type**: *string*  
  **required**: *false*  
  **default**: *string*  
  **values**: *bool*, *int*, *float*, *char*, *string*, *command*, *subcommand*,
  *option*, *file*, *directory*, *path*, *any*
  **example**:

  ```yaml
  examples:
    Display just a specific line:
      code: "sed ${option} '${line}p'"
      annotations:
        option:
          type: option
          values: [--silent, -n]
  ```

- `minimum`: minimum placeholder value  
  **type**: *integer*, *number*, *string*  
  **required**: *false*  
  **example**:

  ```yaml
  examples:
    Display just a specific line:
      code: "sed ${option} '${line}p'"
      annotations:
        line:
          type: int
          minimum: 1
  ```

- `maximum`: maximum placeholder value  
  **type**: *integer*, *number*, *string*  
  **required**: *false*  

- `repeat-minimum`: minimum amount of placeholder repetitions  
  **type**: *integer*  
  **required**: *false*  
  **default**: *0*

- `repeat-maximum: <value>`: maximum amount of placeholder repetitions  
  **type**: *integer*  
  **required**: *false*  
  **default**: *infinity*

- `repeat-separator: <value>`: separator between placeholder repetitions  
  **type**: *string*  
  **required**: *false*  
  **default**: *space*

  ```yaml
  examples:
    Execute a java program and use specific third-party or user-defined classes:
      code: java -classpath ${classes} ${class}
      annotations:
        classes:
          repeat-minimum: 1
          repeat-separator: ":"
  ```

- `alternative`: whether to correlate placeholder values with alternative  
  **type**: *boolean*  
  **required**: *false*  
  **default**: *false*

  ```yaml
  examples:
    Test if a specific variable is (equal|not equal) to a string:
      code: '[ "$${first-variable}" ${operator} "${value}" ]'
      annotations:
        operator:
          type: string
          values: ["==", "!="]
          alternative: true
  ```

##### List like annotations (`examples.<code-example>.code.<annotation>.<list-annotation>`)

The following list like annotations are supported:

- `values`: all placeholder values
  array  
  **type**: *array of integer*, *array of number*, *array of string*  
  **required**: *false*  
  **default**: *[]*  
  **unique items**: *true*  
  **example**:

  ```yaml
  examples:
    Display just a specific line:
      code: "sed ${option} '${line}p'"
      annotations:
        option:
          type: option
          values: [--silent, -n]
  ```

- `examples`: placeholder example values
  array  
  **type**: *array of integer*, *array of number*, *array of string*  
  **required**: *false*  
  **default**: *[]*  
  **unique items**: *true*  
  **example**:

  ```yaml
  examples:
    Display just a specific line:
      code: "sed ${option} '${line}p'"
      annotations:
        line:
          type: int
          minimum: 1
          examples: [1]
  ```

- `path-type`: a placeholder file/directory/path type  
  **type**: *array of string*  
  **required**: *false*  
  **default**: *[relative, absolute]*  
  **unique items**: *true*  
  **values**: *relative*, *absolute*
  **requires**: `type` to be one of *file*, *directory*, *path*  

- `extension-required: <boolean>`: whether a file/path extension is required  
  **type**: *boolean*  
  **required**: *false*  
  **default**: *false*  
  **unique items**: *true*  
  **requires**: `type` to be one of *file*, *directory*, *path*  

### Description placeholders (`examples.<code-example>.<placeholder>`)

> :bell: Compatibility note: double braces are not used.  
> :bookmark_tabs: Escape sequences: `\$`.

Description placeholders are constructs used to substitute first example values
from code placeholders. Their syntax is the same as for code placeholder, just
semantic is slightly different:

```yaml
examples:
  Transform all "${search}" (extended regex) occurrences to upper case in all input lines:
    code: "sed ${option} 's/(${search})/\\U\\1/g'"
    annotations:
      option:
        type: option
        values: [--regexp-extended, -E]
      search:
        type: string
        examples: ["apple"]
```

## Page examples

[`sleep`](https://github.com/tldr-pages/tldr/blob/main/pages/common/sleep.md) will be rewritten as:

```yaml
title: sleep
summary:
  description: Delay for a specific amount of time
  aliases: [gsleep]
  version: [--version, -v]
  help: [--help, -h]
  more-information: https://www.gnu.org/software/coreutils/sleep

examples:
  Delay for specific amount of ([s]econds|[m]inutes|[h]ours|[d]ays):
    code: "sleep ${seconds}${suffix}"
    annotations:
      seconds:
        type: int
        minimum: 0
        examples: [2]
      suffix:
        values: [s, m, h, d]
        alternative: true
```

[`mate-calc`](https://github.com/tldr-pages/tldr/blob/main/pages/linux/mate-calc.md) will be rewritten as:

```yaml
title: mate-calc
summary:
  description: Calculate specific mathematic expressions in MATE desktop environment
  aliases: [mate-calculator]
  version: [--version, -v]
  help: [--help, -h]
  more-information: https://manned.org/mate-calc

examples:
  Start the calculator: mate-calc
  Calculate a specific mathematic expression:
    code: "mate-calc ${solve} ${expression}"
    annotations:
      solve:
        type: option
        values: [--solve, -s]
      expression:
        type: string
        examples: ["2 + 5"]
```

[`sed`](https://github.com/tldr-pages/tldr/blob/main/pages/osx/sed.md) will be rewritten as:

```yaml
title: sed
summary:
  description: Edit specific text in a scriptable manner
  see-also: [awk, ed]
  version: [--version, -v]
  help: [--help, -h]
  more-information: https://keith.github.io/xcode-man-pages/sed.1.html

examples:
  Replace all "apple" (basic regex) occurrences with "mango" (basic regex) in all input lines:
    code: "sed 's/${search}/${replacement}/g'"
    annotations:
      search:
        type: string
        examples: ["apple"]
      replacement:
        type: string
        examples: ["mango"]
  
  Execute a specific script [f]ile:
    code: "sed ${option} ${script}"
    annotations:
      option:
        type: option
        values: [--file, -f]
      script:
        type: file
        examples: ["script.sed"]
  
  Replace all "apple" (extended regex) occurrences with "APPLE" (extended regex) in all input lines:
    code: "sed ${option} 's/${search}/\\U\\1/g'"
    annotations:
      option:
        type: option
        values: [--regexp-extended, -E]
      search:
        type: string
        examples: ["(apple)"]

  Display just a first line:
    code: "sed ${option} '${line}p'"
    annotations:
      option:
        type: option
        values: [--silent, -n]
      line:
        type: int
        minimum: 1
        examples: [1]

  Replace all "apple" (basic regex) occurrences with "mango" (basic regex) in a specific file and save a backup of the original file:
    code: "sed ${option} bak 's/${search}/${replacement}/g' ${file}"
    annotations:
      option:
        type: option
        values: [--in-place, -i]
      search:
        type: string
        examples: ["apple"]
      replacement:
        type: string
        examples: ["mango"]
      file:
        type: file
        examples: ["~/.bashrc"]
```
