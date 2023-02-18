# Supported syntax

![image](https://img.shields.io/badge/version-2.6.0-green)

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
- [CLI tags](./type-specific/cli.md)/[directory tags](./type-specific/directory.md)

#### Why not TlDr?

To use validated and simplified summary syntax.

##### Redundant backticks and `or`

Due to missing smart TlDr clients TlDr pages themselved should be written in a way
they should be rendered. It means than contributors have to write more than they could.
To compare in Command Line Interface Pages it's possible to list similar commands just via comma
and let render decide how to display such list:

```md
> See also: grep, awk, sed
```

But in TlDr it's not possible and you encouraged to write this:

```md
> See also: `grep`, `awk`, or `sed`.
```

And if maintainers decide to change syntax of `See also`, let's say not to use `or`
before the last term they should remove it in all pages. It contradicts DRY principle.

##### Redundant angle brackets

Almost the same applies to `More information` tag. TlDr contributors want to use
standard Markdown syntax while adding some extenions (like placehodlers) and restrictions
to it. It results in more keystrokes. While in Command Line Interface Pages you just write:

```md
> More information: https://www.gnu.org/software/coreutils/sleep
```

in TlDr the only one correct way to do the same thing is:

```md
> More information: <https://www.gnu.org/software/coreutils/sleep>.
```

##### Missing standardized syntax for version and help examples

As for now TlDr doesn't have any syntax to automatically generate such examples
not to waste space for a such common thing. So every person should write them manually
like this:

```md
- Display version:

`sed --version`
```

and control their order to make pages consistent instead of using the power of render:

```md
> Version: --version
```

##### No unified way to tell that command is deprecated or should not be directly used

The same issue happens when it comes to mentioning the fact that some command is
internal and must not be used directly by user or when something is deprecated
and replaced by a newer alternative. It's not automated in TlDr and leads to [these](https://github.com/tldr-pages/tldr/blob/main/pages/common/auditd.md) descriptions:

```md
> This responds to requests from the audit utility and notifications from the kernel.
> It should not be invoked manually.
```

instead of letting render to decide how to notify users about this:

```md
Internal: true
```

##### No official support for pages explaining directories

TlDr doesn't officially provide such pages, contradictionary to this project.

## Examples

- [CLI code examples](./type-specific/cli.md)/[directory file examples](./type-specific/directory.md)

## Best practices

### Summary and example descriptions

- Always add dot before mentioned extensions in description.
- [CLI page best practices](./type-specific/cli.md)

## Page examples

[`sleep`](https://github.com/tldr-pages/tldr/blob/main/pages/common/sleep.md) will be rewritten as:

```md
# sleep

> Delay for a specific amount of time
> More information: https://www.gnu.org/software/coreutils/sleep

- Delay in [s]econds:

`sleep {int seconds: 2}s`

- Delay in [m]inutes:

`sleep {int minutes: 2}m`

- Delay in [h]ours:

`sleep {int hours: 2}h`

- Delay in [d]ays:

`sleep {int days: 2}d`
```

[`mate-calc`](https://github.com/tldr-pages/tldr/blob/main/pages/linux/mate-calc.md) will be rewritten as:

```md
# mate-calc

> Calculate specific mathematic expressions in MATE desktop environment
> More information: https://manned.org/mate-calc

- Start the calculator:

`mate-calc`

- Calculate a specific mathematic expression:

`mate-calc --solve {string expression: 2 + 5}`
```

[`sed`](https://github.com/tldr-pages/tldr/blob/main/pages/osx/sed.md) will be rewritten as:

```md
# sed

> Edit specific text in a scriptable manner
> See also: awk, ed
> More information: https://keith.github.io/xcode-man-pages/sed.1.html

- Replace all "apple" (basic regex) occurrences with "mango" (basic regex) in all input lines:

`{command input command} | sed 's/{string search string: apple}/{string replacement string: mango}/g'`

- Execute a specific script [f]ile:

`{command input command} | sed {option: --file, -f} {/?path script: script.sed}`

- Replace all "apple" (extended regex) occurrences with "APPLE" (extended regex) in all input lines:

`{command input command} | sed {option enable extended regular expressions: --regexp-extended, -E} 's/{string search string: (apple)}/\U\1/g'`

- Display just a first line:

`{command input command} | sed {option print nothing by default: --silent, -n} '{int line count: 1}p'`

- Replace all "apple" (basic regex) occurrences with "mango" (basic regex) in a specific file and save a backup of the original file:

`sed {option: edit input files: --in-place, -i} bak 's/{string search string: apple}/{string replacement string: mango}/g' {/?file input file}`
```

[`tar`](https://github.com/tldr-pages/tldr/blob/main/pages/common/tar.md) will be rewritten as:

```md
# tar

> Archiving utility
> Often combined with a compression method, such as gzip or bzip2
> More information: https://www.gnu.org/software/tar

- [c]reate an archive and write it to a [f]ile:

`tar {option mode: --create, -c} {option: --file, -f} {/?file archive: target.tar} {/?path+ input}`

- [c]reate a gzipped archive and write it to a [f]ile:

`tar {option mode: --create, -c} --gzip {option: --file, -f} {/?file archive: target.tar.gz} {/?path+ input}`

- [c]reate a gzipped archive from a directory using relative paths:

`tar {option mode: --create, -c} --gzip {option: --file, -f} {/?file archive: target.tar.gz} --directory={directory input} .`

- E[x]tract a (compressed) archive [f]ile into the current directory [v]erbosely:

`tar {option mode: --extract, -x} {option enable verbose mode: --verbose, -v} {option: --file, -f} {/?file archive: source.tar.gz, source.tar.bz2, source.tar.xz}`

- E[x]tract a (compressed) archive [f]ile into the target directory:

`tar {option mode: --extract, -x} {option: --file, -f} {/?file archive: source.tar.gz, source.tar.bz2, source.tar.xz} --directory={directory target}`

- [c]reate a compressed archive and write it to a [f]ile, using [a]rchive suffix to determine the compression program:

`tar {option mode: --create, -c} {option use archive suffix to determine compression program: --auto-compress, -a} {option: --file, -f} {/?file archive: target.tar.xz} {/?path+ input}`

- Lis[t] the contents of a tar [f]ile [v]erbosely:

`tar {option mode: --list, -t} {option enable verbose mode: --verbose, -v} {option: --file, -f} {/?file archive: source.tar}`

- E[x]tract files matching a pattern from an archive [f]ile:

`tar {option mode: --extract, -x} {option: --file, -f} {/?file archive: source.tar} --wildcards "{string glob: *.html}"`
```

Note several mistakes done in the original page:

- incorrect placeholder for paths used: `path/to/*` expected intead of `{{target.tar}}`  
  reason: such incorrect placeholders will not be recognized correctly by a script
  which relies on style guide
- incorrect variadic argument representation used: `...` expected instead of `{{file1}} {{file2}} {{file3}}`  
  reason: tar accepts not just 3 arguments even if in example just 3 are passed
- incorrect multiple extension syntax used: one extension expected instead of `[.gz|.bz2|.xz]`  
  reason: such syntax is undefined by style guide and will not be recognized correctly
  by a script which relies on style guide

## Why not Command Line Interface Pages?

Even syntax is highly standardized it may be complicated for newcomers and it may
be simpler to contribute to TlDr project instead of this one. But it appears that
in the long run it easier to support and unify Command Line Interface Pages pages instead of TlDr
ones as more things are automated and moved to render.
