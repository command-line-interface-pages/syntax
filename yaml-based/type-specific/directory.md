# Supported syntax

## Page summary (`summary`)

### Tags (`summary.<tag>`)

#### Singular value tags (`summary.<singular-tag>`)

> :information_source: Required: dependent.

The following singular value tags are supported:

- `optional`: whether file can be absent or not  
  **type**: *boolean*  
  **required**: *false*  
  **default**: *false*  
  **example**:

  ```yaml
  examples:
    The C shell:
      name: csh
      optional: true
  ```

- `is`: where to import details about file from  
  **type**: *object*  
  **required**: *false*  
  **default**: *false*  
  **example**:

  ```yaml
  examples:
    The C shell:
      name: csh
      optional: true
      is: url-to-yaml-file-describing-file
  ```

#### List like tags (`summary.<array-tag>`)

The following list like tags are supported:

- `compatible`: structure compatible directories  
  **type**: *array of string*  
  **required**: *false*  
  **default**: *[]*  
  **unique items**: *true*  
  
  **note**: Directory `<first-directory>` considered structure compatible with
  directory `<second-directory>` when `<first-directory>` support all
  subdirectories and files that `<second-directory>` does. It doesn't matter
  whether this happens by default or not. Deprecated subdirectories and files
  don't count while comparing structure compatibility.

## File examples (`examples.<file-example>`)

File examples are file descriptions and actual file names like:

```yaml
examples:
  Utility to concatenate files to standard output: cat
```

or:

```yaml
examples:
  Utility to concatenate files to standard output:
    name: cat
```

### Mnemonics (`examples.<file-example>.<mnemonic>`)

> :bookmark_tabs: Escape sequences: `\[`, `\]`.

Mnemonics are constructs used to refer to parts of file names.

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
con[cat]enate
```

When mnemonic is equal to the whole option or subcommand it looks like this:
`[sync]`.

Spaces and pipe characters are not allowed inside square brackets.
