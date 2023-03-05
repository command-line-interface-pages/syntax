# Supported syntax

![image](https://img.shields.io/badge/version-2.7.0-green)

All syntax is formalized, and clearly defined how it must be interpreted denying
changing it from case to case for some unclear reason. Disabling errors is not possible
to keep everything standardized.

All unrecognized escape sequences are treated literally.

All Command Line Interface Pages pages must have `.clip` extension.

## Page summary

> :bell: Compatibility note: trailing dot and angle brackets for url are not supported.

Page summary is a combination of command/directory description,
documentation link and other information about command/directory like:

```md
> Calculate specific mathematic expressions in MATE desktop environment
> More information: https://manned.org/mate-calc
```

or

```md
> Essential user command binaries (for use by all users)
> More information: https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch03s04.html
```

Leading angle bracket is a required syntax and always should be put
at the beginning of the line. The first one or two lines where no colons exist
are treated as a command/diretory explanation.

### Mnemonics

Mnemonics are constructs used to refer to characters used in contracted command/directory
names.

#### General syntax

> :bookmark_tabs: Escape sequences: `\[`, `\]`.

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

like:

```md
GNU [b]ourne-[a]gain [sh]ell
```

or

```md
/[bin]aries
```

When mnemonic is equal to the whole word it looks like this: `[elvish]`.

Spaces and pipe characters are not allowed inside square brackets.

### Tags

> :fountain_pen: Analogue: colon-based syntax is originated from [YAML keys](https://www.cloudbees.com/blog/yaml-tutorial-everything-you-need-get-started).

Tags are contructs used to add some additional information about a command/directory
being explained.

#### General syntax

> :bookmark_tabs: Escape sequences: unavailable.

All tags begin with a tag name, followed by a colon with a at least one space (one by default)
with a tag value:

```md
<tag-name>: <tag-value>
```

where `<tag-name>` is a tag name and `<tag-value>` is a tag value.

Tags are case-sensitive.

#### Singular value tags

The following command/directory singular value tags are supported:

- `More information: <link>`: link to a documentation  
  :blue_book: **where**:
  - `<link>` is a link
  
  :duck: **example** `More information: https://manned.org/mate-calc`
- `Internal: <boolean>`: indicator for:
  - not directly callable commands
  - not directly used directories
  
  :blue_book: **where**:
  - `<boolean>` is one of: `true` and `false`  
  
  :duck: **example** `Internal: true`  
  :bulb: **note** A default message to be shown when value is `true` is: `This command should not be called directly`
- `Deprecated: <boolean>`: indicator for deprecated commands/directories  
  :blue_book: **where**:
  - `<boolean>` is one of: `true` and `false`
  
  :duck: **example** `Deprecated: true`  
  :bulb: **note** A default message to be shown when value is `true` is: `This command is deprecated and should not be used`

#### List like tags

> :bell: Compatibility note: `or` is not supported for list like tags.

The following command/directory list like tags are supported:

- `See also: <<command|directory>1, <command|directory>2, ...>`: comma-separated
  similar command/directory list  
  :blue_book: **where**:
  - `<<command|directory>1, <command|directory>2, ...>` are commands or directories
  
  :duck: **examples**: `See also: awk, ed`
- `Aliases: <<command|symlink>1, <command|symlink>2, ...>`: comma-separated
  alias/symlink list  
  :blue_book: **where**:
  - `<<command|symlink>1, <command|symlink>2, ...>` are commands or directory symlinks
  
  :duck: **examples**: `Aliases: egrep, fgrep`
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
