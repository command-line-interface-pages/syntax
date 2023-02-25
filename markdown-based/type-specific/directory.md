# Supported syntax

## Page summary

### Tags

#### List like tags

> :bell: Compatibility note: `or` is not supported for list like tags.

The following list like tags are supported:

- `Structure compatible: <directory1, directory2, ...>`: comma-separated directory
  containing structure compatible commands  
  :blue_book: **where**:
  - `<directory1, directory2, ...>` are directories
  
  :bulb: `Structure compatible: $HOME/bin`  
  :pencil: **note** Directory `<first>` considered structure compatible with
  directory `<second>` when `<first>` support all subdirectories that `<second>`
  does. Deprecated subdirectories doesn't count while comparing structure
  compatibility.

## File examples

File examples are combinations of file descriptions and actual file names like:

```md
- File used to keep track of every registered user that has access to a system:

`/etc/passwd`
```

Leading dash and two backticks are required syntax and always should be put
at the beginning and at the end of the line respectively.

File description always should have a trailing colon and be a one line. Almost the
same applies to a code example, it also should be one line.

### Mnemonics

Mnemonics are constructs used to refer to files.

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
- `<mnemonic-content>` is a file name, must contain at least one character
- `<trailing-word-characters>` are term characters after a mnemonic, may be
  empty string

like:

```md
[pass]word
```

When mnemonic is equal to the whole file it looks like this:  `[home]`.

Spaces and pipe characters are not allowed inside square brackets.

## Page examples

```md
# /bin

> Essential user command binaries (for use by all users)
> Must not contain subdirectories
> More information: https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch03s04.html

- Utility to concatenate files:

`cat`
```
