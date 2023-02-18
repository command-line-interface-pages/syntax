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
  **like** `More information: https://manned.org/mate-calc`
- `Internal: <boolean>`: indicator for:
  - not directly callable commands
  - not directly used directories
  
  :blue_book: **where**:
  - `<boolean>` is one of: `true` and `false`  
  **like** `Internal: true`  
  **note** A default message to be shown when value is `true` is: `This command should not be called directly`
- `Deprecated: <boolean>`: indicator for deprecated commands/directories  
  :blue_book: **where**:
  - `<boolean>` is one of: `true` and `false`
  
  **like** `Deprecated: true`  
  **note** A default message to be shown when value is `true` is: `This command is deprecated and should not be used`

#### List like tags

> :bell: Compatibility note: `or` is not supported for `See also`.

The following list like tags are supported:

- `See also: <command1, command2, ...>`: comma-separated similar command list
  **where** `<command1, command2, ...>` are commands like `See also: awk, ed`
- `Aliases: <command1, command2, ...>`: comma-separated alias list **where**
  `<command1, command2, ...>` are commands like `Aliases: egrep, fgrep`
- `Syntax compatible: <command1, command2, ...>`: comma-separated version command list
  **where** `<command1, command2, ...>` are commands like `Syntax compatible: sh`
- `Help: <flag1, flag2, ...>`: comma-separated help flag list
  for a generated code example **where** `<flag1, flag2, ...>` are flags
  like `--help` and `-h` like `Help: --help, -h`
- `Version: <flag1, flag2, ...>`: comma-separated version flag list
  for a generated code example **where** `<flag1, flag2, ...>` are flags
  like `--version` and `-v` like `Version: --version, -v`

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

## Code examples

Code examples are combinations of code descriptions and actual commands like:

```md
- Delay in [s]econds:

`sleep {int seconds: 2}s`
```

Leading dash and two backticks are required syntax and always should be put
at the beginning and at the end of the line respectively.

Code description always should have a trailing colon and be a one line. Almost the
same applies to a code example, it also should be one line.

### Alternatives

Alternatives are constructs used to describe options or subcommands where more 2
or more choices available.

#### General syntax

> :bookmark_tabs: Escape sequences: `\(`, `\)`.

All alternatives begin with a single opening parenthesis `(` and end with a
closing one `)`:

```md
(<alternative-content1>|<alternative-content2>|...)
```

where `<alternative-contentX>` (where `X` is some number) is an option or subcommand
description like:

```md
- Test if a specific variable is (equal|not equal) to a string:

`[ "${string variable: foo}" {string operator: ==|string operator: !=} "{string string: Hello world!}" ]`
```

where `equal` matches `==` and `not equal` `!=` respectively. Alternative count
in code description must match alternative count inside a complex placeholder with
alternatives. No more than one description alternative and complex placeholder is
allowed to make render interpret it properly. Also note that complex placeholder
in such situation must contain one value example.

### Mnemonics

Mnemonics are constructs used to refer to options or subcommands.

#### General syntax

> :bookmark_tabs: Escape sequences: `\[`, `\]`.

All mnemonics begin with a single opening square brace `[` and end with a
closing one `]`:

```md
<leading-word-characters>[<mnemonic-content>]<trailing-word-characters>
```

where:

- `<mnemonic-content>` is an command name, must contain at least one character
- `<leading-word-characters>` are term characters before a mnemonic, may be
  empty string
- `<trailing-word-characters>` are term characters after a mnemonic, may be
  empty string

like:

```md
[h]elp
```

When mnemonic is equal to the whole option or subcommand it looks like this:  `[help]`.

Spaces and pipe characters are not allowed inside square brackets.

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

### Placeholders

Placeholders are contructs used to substitute some user entered data.

#### General syntax

> :bell: Compatibility note: double braces are not used.  
> :bookmark_tabs: Escape sequences: `\{`, `\}`, `\:`, `\.`, `\,`, `\<space>`, `\|`.

All placeholder begin with a single opening curly brace `{` and end with a
closing one `}`:

```md
{<placeholder-content>}
```

where `<placeholder-content>` is some special treated text by Command Line Interface Pages parser and
render like:

```md
{file image}
```

Placeholders can provide both argument semantics and
example values, so to be more concrete `<placeholder-content>` can be specified as:

```md
{<placeholder-explanation>: <example-values>}
```

where `<placeholder-explanation>` is a some text explaining what placeholder is
used for and `<example-values>` are some comma-separated example values which
can be substituted instead of this placeholder. Example:

```md
{file image to process: rose.jpg, cactus.png}
```

It's possible to omit `: example-values` and put just placeholder semantics like

```md
{file image to process}
```

Placeholder examples are just samples of possible values and not all possible
values which can be substitited.

Spacing inside `<placeholder-explanation>` doesn't matter, all spaces are replaced
by one underscore while rendering. Almost the same happens with `<example-values>`,
all unescaped spaces are replaced by one space while render. It means that
`my  rose.jpg` in:

```md
{file image to process: my  rose.jpg}
```

will be rendered as `my rose.jpg`.

Placeholder nesting is not supported now.

#### Primitive placeholders

> :fountain_pen: Analogue: question mark syntax is originated from [nullable types](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/nullable-value-types).

Placeholder explanation always begins with a keyword which determines what kind
placeholder is. The following keywords are supported:

- `bool`: boolean value
- `int`: integer value
- `float`: float value
- `char`: character value
- `string`: string value
- `command`: executable value
- `option`: option value
- `file`: relative regular file path value
- `directory`: relative directory path value
- `path`: relative path value
- `/file`: absolute regular file path value
- `/directory`: absolute directory path value
- `/path`: absolute path value
- `/?file`: relative or absolute regular file path value
- `/?directory`: relative or absolute directory path value
- `/?path`: relative or absolute path value (syntax sugar)
- `remote-file`: relative remote regular file path value
- `remote-directory`: relative remote directory path value
- `remote-path`: relative remote path value
- `/remote-file`: absolute remote regular file path value
- `/remote-directory`: absolute remote directory path value
- `/remote-path`: absolute remote path value
- `/?remote-file`: relative or absolute remote regular file path value
- `/?remote-directory`: relative or absolute remote directory path value
- `/?remote-path`: relative or absolute remote path value
- `any`: anything
- `remote-any`: remote arbitrary object

`bool` accepts any booleans, like `true`, `false`, `on`, `off`, etc. The main point here
is to represent type with two values with enabled/disabled semantics.

`command` placeholder can be used to represent just a singular command or subcommand.
It means that it's invalid to use it in the following case:

```md
- Execute specific [c]ommands:

`bash -c {string commands: "echo 'Hello world!'"}`
```

as `-c` accepts any Bash code, not just command or subcommand that's why `string`
placeholder is used. Note that it means that quantifiers for such placeholder are
useless.

`any` or `remote-any` are used for placeholders those accept all types of arguments listed above
this keyword while `path` is a combinational meaning of `file` and `directory`
keywords.

`option` accepts just two examples: long and short option in this order and must
be used to show both flags. `option` placeholder doesn't mandate description
opposed to other placeholders. When description is missing the next option description
is used as the description for an option. It can be used for option with arguments
like `{option: --file, -f} {/?file archive: target.tar}`. However, two consecutive
placeholders without descriptions are invalid.

When user wants to switch between code description alternatives and make code examples
change placeholders with multiple alternatives are rendered as their first example
value like a regular code, not like a placeholder. For instance the following
code:

```md
- Test if a specific variable is (equal|not equal) to a string:

`[ "${string variable: foo}" {string operator: ==|string operator: !=} "{string string: Hello world!}" ]`
```

will can be rendered like this code:

```md
- Test if a specific variable is equal to a string:

`[ "${string variable: foo}" == "{string string: Hello world!}" ]`
```

or that one:

```md
- Test if a specific variable is not equal to a string:

`[ "${string variable: foo}" != "{string string: Hello world!}" ]`
```

Example:

```md
sleep {int seconds: 2}{char suffix: s, m, h, d}
```

String, file, directory, path and any placeholders are always rendered inside double
quotes.

If there are two dots between two integers without spaces around it in `<placeholder-explanation>`
then such construct is expanded to all numbers in this range. For instance:

```md
{int range: 1..10}
```

will be expanded to:

```md
{int range: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
```

Due to this expansion nature don't use it for extremely long ranges as it will
make pages unreadable after rendering even knowing that fact that just the first
10 members are shown and others are stripped out.

#### Primitive placeholder rendering

> :bell: Compatibility note: `path/to/file_or_directory` and `/path/to/file_or_directory`
> are not used.

All placeholders rendered a little bit differently to keep almost the same user
experience as it was before placeholder standardization:

- `{bool some text}` is rendered as `some_text`
- `{int some text}` is rendered as `some_text`
- `{float some text}` is rendered as `some_text`
- `{char some text}` is rendered as `some_text`
- `{string some text}` is rendered as `"some_text"`
- `{command some text}` is rendered as `some_text`
- `{option some text: --long, -s}` is rendered as `--long` or `-s` depending on
  what option's style user prefers
- `{file some text}` is rendered as `"path/to/some_text_file"`
- `{directory some text}` is rendered as `"path/to/some_text_directory"`
- `{path some text}` is rendered as `"path/to/some_text_file"|"path/to/some_text_directory"`
- `{/file some text}` is rendered as `"/path/to/some_text_file"`
- `{/directory some text}` is rendered as `"/path/to/some_text_directory"`
- `{/path some text}` is rendered as `"/path/to/some_text_file"|"/path/to/some_text_directory"`
- `{/?file some text}` is rendered as `"path/to/some_text_file"`
- `{/?directory some text}` is rendered as `"path/to/some_text_directory"`
- `{/?path some text}` is rendered as `"path/to/some_text_file"|"path/to/some_text_directory"`
- `{remote-file some text}` is rendered as `"remote/path/to/some_text_file"`
- `{remote-directory some text}` is rendered as `"remote/path/to/some_text_directory"`
- `{remote-path some text}` is rendered as `"remote/path/to/some_text_file"|"remote/path/to/some_text_directory"`
- `{/remote-file some text}` is rendered as `"/remote/path/to/some_text_file"`
- `{/remote-directory some text}` is rendered as `"/remote/path/to/some_text_directory"`
- `{/remote-path some text}` is rendered as `"/remote/path/to/some_text_file"|"/remote/path/to/some_text_directory"`
- `{/?remote-file some text}` is rendered as `"remote/path/to/some_text_file"`
- `{/?remote-directory some text}` is rendered as `"remote/path/to/some_text_directory"`
- `{/?remote-path some text}` is rendered as `"remote/path/to/some_text_file"|"remote/path/to/some_text_directory"`
- `{any some text}` is rendered as `"some_text"`
- `{remote-any some text}` is rendered as `"remote some_text"`

Spaces can be left as they were, without replacing with underscores. Forward path
slashes will be rendered as backward ones in Windows environment.

#### Optional primitive placeholders

Placeholders can be optional meaning that the corresponding argument may or may
not be provided. To make a placeholder optional put a question mark `?` after
it's keyword like `{file? image: rose.jpg}`.

#### Optional primitive placeholder rendering

Optional primitive placeholders are rendered the same as primitive ones except
different coloring by default.

#### Repeated primitive placeholders

> :bell: Compatibility note: `...` is not used.

Primitive placeholders also can accept more than one argument. For this purpose
repetition syntax was created. The following quantifiers are supported:

- `*`: accept 0 or more arguments like `{file* image: rose.jpg}`
- `+`: accept 1 or more arguments like `{file+ image: rose.jpg}`
- `{<from>}..{<to>}`: accept `<from>` to `<to>` arguments like `{file 2..10 image: rose.jpg}`
  At least one space after a placeholder keyword is required. It's possible to
  omit any of included range borders but not both like `{file 2.. image: rose.jpg}`.

To indicate that the same values are not allowed in repeated arguments add an
exlamation mark after a quantifier like `{file*! image: rose.jpg}` and
`{file 2..10! image: rose.jpg}`.

#### Repeated primitive placeholder rendering

Repeated primitive placeholders are rendered as primitive placeholders but in
a different color out of the box and with a trailing asterisk to denote that
repetition is possible. User should pass a special option to TlDr client to show
how many repetitions are possible.

#### Complex placeholders

Complex placeholders are made of primitive ones. They are delimited by pipe `|`
characters like `{file* image: rose.jpg|directory images}`. At least two alternatives
should be listed.

It's not defined how much alternatives should be used when substituting actual
arguments instead of placeholders.

#### Complex placeholder rendering

Complex placeholders rendering are rendered as several primitive placeholders
delimited by a pipe `|` character colored in a unique color by default.

#### Why not TlDr?

To use validated and simplified and more expressive placeholder syntax.

##### Lost semantic or lost sample values

In TlDr some placeholders can contain notes about what placeholder actually represents
and others not. For instance it's possible to write `{{path/to/image_file}}` to
tell user that file is an image and not anything else. On the other hand with integer
placeholders it's not the case `{{4}}`. What is 4? Such placeholders make code examples
not self-contained, user have to read description to understand placeholder semantic.

Command Line Interface Pages solves this issue by requiring semantic to be always present, while
sample values are optional:

```md
{int seconds: 2}
```

instead of

```md
{{2}}
```

with lost placeholder description or:

```md
{{seconds}}
```

with missed example value.

##### Long combination of ellipsis and possibly absolute path

To write a placeholder which accepts variadic number of arguments in TlDr you
should use long ellipsis construct:

```md
{{path/to/image_file1 path/to/image_file2 ...}}
```

while here the same thing can be rewritten in a much shorter way:

```md
{/?file* image}
```

and explicitly tells user that file path can be relative or absolute. Note that in TlDr
it's impossible to require just relative path, as placeholders without a leading slash
permit both absolute and relative paths.

##### Not used pipe character

TlDr pages sometimes violate their own style guide. For instance they can provide
`{{path/to/excluded_file_or_directory}}` placeholders in code examples. But how to
interpret it? Does `excluded` correspond to just file or to both terms? Such syntax
is unavailable in Command Line Interface Pages and maintainers must use one of the following equivalents:

```md
{path+ excluded}
```

or:

```md
{file+ excluded file|directory+ directory}
```

##### Not used generalized command syntax

TlDr pages sometimes prefer concrete placeholders and not ellipsis construct available
for such purposeses like:

```md
tar cf {{target.tar}} {{file1}} {{file2}} {{file3}}
```

The problem it's not possible to tell how much file broken (invalid syntax is used,
it should begin with `path/to/`) arguments are expected: 1, 2, 3 or more? Command Line Interface Pages
solves this problem by mandating describing general command syntax:

```md
`tar cf {/?file archive: target.tar} {/?path+ input}`
```

while providing sample values too.

## Best practices

### Summary and code descriptions

- Always add mnemonics when you know where to add them. When both long and short
  options or commands are presented add mnemonic just for a short option.
- Constantly separate alternatives in descriptions with a pipe character
  like `- Test if a specific variable is equal|not equal to a string:` instead of
  `- Test if a specific variable is equal or not equal to a string:`.
- Always prefer "display" verb when dealing with singular object instead of
  "print", "get", "show", etc. For instance write `- Display help:` instead of
  `- Show help:`.
- Always use "list" verb for multiple objects of the same kind. For instance prefer
  `- List all files in a specific directory:` instead of `- Show all files in a specific directory:`.
- Constantly explicitly mention that all available objects are handled like
  `- List all files in a specific directory:` instead of `- List files in a specific directory:`
  as in the second case it's not clear what files are listed.
- When explaining command moving or copying some data from one place to another
  always explicitly use "source" or "destination" nouns to specify what placeholder
  should be interpreted as a data source and what as a target. For example write:
  `azcopy copy '{/?file local input}' 'https://{string remote storage account}.blob.core.windows.net/{string remote container}/{string blob}'` and not `azcopy copy '{/?file input}' 'https://{string storage account}.blob.core.windows.net/{string container}/{string blob}'`.
- Always add dot before mentioned extensions in description.

### Code examples

- Use repetition quantifiers where variable number of arguments expected.
  Tell users what command can accept and not it accepts in some example.
  For instance instead of `tar cf {/?file archive: target.tar} {/?file first input} {/?file second input}`
  use `tar cf {/?file archive: target.tar} {/?path+ input}`.
- Permanently prefer GNU-style (`--help`) or Unix-style (`-h`) options over subcommands
  with the same semantics. Write
  `tar {option mode: --create, -c} {option archive: --file, -f} {/?file archive: target.tar} {/?path+ input}`
  instead of `tar cf {/?file archive: target.tar} {/?path+ input}`.
- Don't use `name` suffix explicitly, assume that when it's omitted object name
  or it's identifier in other words should be used. Here name and identifier are
  synonyms. For instance instead of `{string package name}` write `{string package}`.
  This rule doesn't apply when the object placeholder describes is itself a name
  or an identifier like in this case:
  
  ```md
  - Add a new package source:

  `choco source add --name {string name} --source {string url}`
  ```

- Always use double quotes in code examples unless they make code examples longer
  than with single quotes.

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
