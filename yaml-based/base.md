# Supported syntax

![image](https://img.shields.io/badge/version-3.3.0-green)

All syntax is formalized, and clearly defined how it must be interpreted denying
changing it from case to case for some unclear reason. Disabling errors is not possible
to keep everything standardized.

All unrecognized escape sequences are treated as errors.

All Command Line Interface Pages written in YAML must have `.yaml` extension.

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

> :bell: Compatibility note: trailing dot isn't treated specially what means
> it's not removed when put at the end and interpreted as a summary part.  
> :information_source: Required: true.

Page summary is a combination of command/directory description,
documentation link and other information about command/directory.

### Summary description (`summary.description`)

> :bell: Compatibility note: trailing dot isn't treated specially what means
> it's not removed when put at the end and interpreted as a summary part.  
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
- `<mnemonic-content>` is a command/directory name, must contain at least one character
- `<trailing-word-characters>` are term characters after a mnemonic, may be
  empty string

When mnemonic is equal to the whole word it looks like this: `[elvish]`.

Spaces are not allowed inside square brackets.

### Tags (`summary.<tag>`)

> :bookmark_tabs: Escape sequences: unavailable.  
> :information_source: Required: false, but recommended when possible.

Tags are constructs used to add some additional information about a command/directory
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

#### Singular value tags (`summary.<singular-tag>`)

> :information_source: Required: dependent.

The following command/directory singular value tags are supported:

- `type`: page type  
  **type**: *string*  
  **required**: *false*  
  **default**: *cli*  
  **values**: *cli*, *directory*
  **example**:

  ```yaml
  summary:
    type: directory
  ```

- `parent`: parent page path in the same repository  
  **type**: *string*  
  **required**: *false*  
  **default**: *""*  
  **example**:

  ```yaml
  summary:
    parent: coreutils
  ```

  **note**: All not explicitly set tags are inherited from the parent page. Circular
  references are not allowed.

- `fake`: whether not to render page and use as a tag store  
  **type**: *boolean*  
  **required**: *false*  
  **default**: *false*  
  **example**:

  ```yaml
  summary:
    fake: true
  ```

- `more-information: <link>`: link to a documentation  
  **type**: *string*, *object*  
  **required**: *true*  
  **example**:

  ```yaml
  summary:
    more-information: https://manned.org/mate-calc # official documentation is expected, not from manned or manrepository
  ```

  ```yaml
  summary:
    more-information:
      official: mate-calc # official documentation, full url should be written
  ```

  ```yaml
  summary:
    more-information:
      manned: mate-calc # man page name, the end url is automatically generated
  ```

  ```yaml
  summary:
    more-information:
      manrepository: mate-calc # man page name, the end url is automatically generated
  ```

- `internal`: whether treat command/directory as not directly callable/used  
  **type**: *boolean*  
  **required**: *false*  
  **default**: *false*  
  **note**: A default message to be shown when value is `true` is: `This command/directory should not be called/used directly`  
  **example**:

  ```yaml
  summary:
    internal: true
  ```

- `deprecated`: whether treat commands/directories as deprecated  
  **type**: *boolean*  
  **required**: *false*  
  **default**: *false*  
  **note**: A default message to be shown when value is `true` is: `This command is deprecated and should not be used`  
  **example**:

  ```yaml
  summary:
    deprecated: true
  ```

- `section`: man page section  
  **type**: *string*  
  **required**: *false*  
  **default**: *regular-executable*  
  **values**:
  
  - *system-executable* (8th section)
  - *game-executable* (6th section)
  - *regular-executable* (1st section, use as a fallback for executables)
  - *system-call* (2nd section)
  - *regular-call* (3rd section, use as a fallback for calls)
  - *special-file* (4th section)
  - *file-format* (5th section)
  - *else* (7th section)
  
  **note**: A default message to be shown when value is `true` is: `This command is deprecated and should not be used`  
  **example**:

  ```yaml
  summary:
    deprecated: true
  ```

#### List like tags (`summary.<array-tag>`)

> :information_source: Required: false.

The following command/directory list like tags are supported:

- `see-also`: similar commands/directories  
  **type**: *array of string*  
  **required**: *false*  
  **default**: *[]*  
  **unique items**: *true*  
  **example**:

  ```yaml
  summary:
    see-also: [awk, sed]
  ```

- `aliases`: command aliases/symlinks  
  **type**: *array of string*  
  **required**: *false*  
  **default**: *[]*  
  **unique items**: *true*  
  **note** Just shell aliases are considered as aliases, command wrappers are not  
  **example**:

  ```yaml
  summary:
    aliases: [egrep, fgrep]
  ```
  
- [CLI tags](./type-specific/cli.md#list-like-tags-summaryarray-tag)/[directory tags](./type-specific/directory.md#list-like-tags-summaryarray-tag)

## Page examples (`examples`)

### I/O streams (`examples.<example>.<stream>`)

I/O streams are devices used to capture input or output from commands like:

```yaml
examples:
  description: Print file contents or error to stderr if it doesn't exist
```

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
command syntax and behavior, but the default assumption done for all commands.

## Best practices

We encourage everyone committing to our official repositories to follow best
practices listed below (while for your own repositories you free to decide how
to write pages on your own):

- Put `title` in the first line.
- Add one empty line after `summary` before code/file examples.
- Delimit all examples by exactly one empty line.
- In other cases don't add extra empty lines.
- Don't use properties just to explicitly state their defaults assuming that
  they can be changed. For instance never describe minimum and/or maximum
  repetition count unless placeholder accepts more than one value.
- [CLI page best practices](./type-specific/cli.md#best-practices)
- [Directory page best practices](./type-specific/directory.md#best-practices)

### Page examples

- [CLI page examples](./type-specific/cli.md#page-examples)
- [Directory page examples](./type-specific/directory.md#page-examples)
