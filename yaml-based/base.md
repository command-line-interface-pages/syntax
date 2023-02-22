# Supported syntax

![image](https://img.shields.io/badge/version-3.3.0-green)

All syntax is formalized, and clearly defined how it must be interpreted denying
changing it from case to case for some unclear reason. Disabling errors is not possible
to keep everything standardized.

All unrecognized escape sequences are treated as errors.

All Command Line Interface Pages pages written in YAML must have `.yaml` extension.

## Page title (`title`)

> :information_source: Required: false.

Page title is a command/directory name like:

```yaml
title: git init
```

or:

```yaml
title: /bin
```

A page title is equal to the file name when not specified.

## Page summary (`summary`)

> :bell: Compatibility note: trailing dot is not supported.  
> :information_source: Required: true.

Page summary is a combination of command/directory description,
documentation link and other information about command/directory.

## Summary description (`summary.description`)

> :bell: Compatibility note: trailing dot is not supported.  
> :information_source: Required: true.

Summary description is a command/directory description like:

```yaml
summary:
    description: Calculate specific mathematic expressions in MATE desktop environment
```

or:

```yaml
summary:
    description: Essential user command binaries (for use by all users)
```

### Mnemonics (`summary.description.<mnemonic>`)

> :bookmark_tabs: Escape sequences: `\[`, `\]`.  
> :information_source: Required: false, but recommended when possible.

Mnemonics are constructs used to refer to characters used in contracted command/directory
names like:

```yaml
summary:
    description: GNU [b]ourne-[a]gain [sh]ell
```

or:

```yaml
summary:
    description: /[bin]aries
```

All mnemonics begin with a single opening square brace `[` and end with a
closing one `]`:

```md
[<leading-word-characters>]<mnemonic-content>[<trailing-word-characters>]
```

where:

- `<leading-word-characters>` are term characters before a mnemonic, may be
  empty string
- `<mnemonic-content>` is an command/directory name, must contain at least one character
- `<trailing-word-characters>` are term characters after a mnemonic, may be
  empty string

When mnemonic is equal to the whole word it looks like this: `[elvish]`.

Spaces are not allowed inside square brackets.

### Tags (`summary.<tag>`)

> :bookmark_tabs: Escape sequences: unavailable.  
> :information_source: Required: false, but recommended when possible.

Tags are contructs used to add some additional information about a command/directory
being explained like:

```yaml
summary:
    more-information: https://manned.org/mate-calc
```

or:

```yaml
summary:
    more-information: https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch03s04.html
```

All tags begin with a tag name, followed by a colon with a at least one space with
a tag value:

```md
<tag-name>: <tag-value>
```

where `<tag-name>` is a tag name and `<tag-value>` is a tag value.

#### Singular value tags (`summary.<singular-tag>`)

> :information_source: Required: true, but not for all.

The following command/directory singular value tags are supported:

- `more-information: <link>`: link to a documentation  
  **type**: string  
  **required**: true  
  **example**:

  ```yaml
  summary:
      more-information: https://manned.org/mate-calc
  ```

- `internal: <boolean>`: indicator for:
  - not directly callable commands
  - not directly used directories
  
  **type**: boolean  
  **required**: false  
  **default**: false  
  **note**: A default message to be shown when value is `true` is: `This command/directory should not be called/used directly`  
  **example**:

  ```yaml
  summary:
      internal: true
  ```

- `deprecated: <boolean>`: indicator for deprecated commands/directories  
  **type**: boolean  
  **required**: false  
  **default**: false  
  **note**: A default message to be shown when value is `true` is: `This command is deprecated and should not be used`  
  **example**:

  ```yaml
  summary:
      deprecated: true
  ```

#### List like tags (`summary.<array-tag>`)

> :information_source: Required: false.

The following command/directory list like tags are supported:

- `see-also: [<command1|directory1>, <command2|directory2>, ...]`: similar command/directory
  array  
  **required**: false  
  **default**: []  
  **unique items**: true  
  **example**:

  ```yaml
  summary:
      see-also: [awk, sed]
  ```

- `aliases: [<command1|symlink1>, <command2|symlink2>, ...]`: command alias/symlink
  array  
  **required**: false  
  **default**: []  
  **unique items**: true  
  **note** Just shell aliases are considered as aliases, command wrappers are not  
  **example**:

  ```yaml
  summary:
      aliases: [egrep, fgrep]
  ```
  
- [CLI tags](./type-specific/cli.md#list-like-tags)/[directory tags](./type-specific/directory.md#list-like-tags)

## Page examples

### I/O streams

I/O streams are devices used to capture input or output from commands.

#### General syntax

All I/O streams are unquoted and written as:

```md
stdin
stdout
stderr
```

stdin must be mentioned just when it's a not default method to read source
data from. stdout must be mentioned until it's default output stream for
some command example. stderr should be always mentioned explicitly when used.

When no output happens mention this fact explicitly and assume that any command
prints something by default. In this case "by default" is not used to mention default
command syntax and behaviour, but the default assumption done for all commands.

## Examples

- [CLI code examples](./type-specific/cli.md#code-examples)/[directory file examples](./type-specific/directory.md#file-examples)

## Best practices

### Summary and example descriptions

- Always add dot before mentioned extensions in description.
- [CLI page best practices](./type-specific/cli.md#best-practices)

### Page examples

- [CLI page examples](./type-specific/cli.md#page-examples)

## Why not Command Line Interface Pages?

Even syntax is highly standardized it may be complicated for newcomers and it may
be simpler to contribute to TlDr project instead of this one. But it appears that
in the long run it easier to support and unify Command Line Interface Pages pages instead of TlDr
ones as more things are automated and moved to render.
