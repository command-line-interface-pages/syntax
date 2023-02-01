# Supported syntax

All syntax is formalized, and clearly defined how it must be interpreted denying
changing it from case to case for some unclear reason. Disabling errors is not possible
to keep everything standardized.

All unrecognized escape sequences are treated literally.

## Command summary

> Compatibility note: trailing dot and angle brackets for url are not supported.

Command summary is a combination of command description, documentation link and
other information about command like:

```md
> Calculate specific mathematic expressions in MATE desktop environment
> More information: https://manned.org/mate-calc
```

Leading angle bracket is a required syntax and always should be put
at the beginning of the line. The first one or two lines where no colons exist
are treated as a command explanation.

### Tags

Tags are contructs used to add some additional information about a command being
explained.

#### General syntax

> Escape sequences: unavailable.

All tags begin with a tag name, followed by a colon with a tag value:

```md
tag-name:tag-value
```

where `tag-name` is a tag name and `tag-value` is a tag value.

Tags are case-sensitive.

#### Singular value tags

The following singular value tags are supported:

- `More information: link`: link to a documentation where `link` is a link
  like `More information: https://manned.org/mate-calc`  
  Link always should be enclosed in angle brackets.

#### List like tags

> Compatibility note: `or` is not supported for `See also`.

The following list like tags are supported:

- `See also: command1, command2, ...`: comma-separated similar command list
  where `command1`, `command2` and `...` are commands like `See also: awk, ed.`
- `Aliases: command1, command2, ...`: comma-separated alias list where
  `command1`, `command2` and `...` are commands like `Aliases: egrep, fgrep.`

#### Why not TlDr?

To use validated and simplified summary syntax.

##### Redundant backticks and `or`

Due to missing smart TlDr clients TlDr pages themselved should be written in a way
they should be rendered. It means than contributors have to write more than they could.
To compare in Better TlDr it's possible to list similar commands just via comma
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
to it. It results in more keystrokes. While in Better TlDr you just write:

```md
> More information: https://www.gnu.org/software/coreutils/sleep
```

in TlDr the only one correct way to do the same thing is:

```md
> More information: <https://www.gnu.org/software/coreutils/sleep>.
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

### Mnemonics

Mnemonics are constructs used to refer to options or subcommands.

#### General syntax

> Escape sequences: `\[`, `\]`.

All mnemonics begin with a single opening square brace `[` and end with a
closing one `]`:

```md
[mnemonic-content]remainig-word-characters
```

where `mnemonic-content` is an option or subcommand name and `remainig-word-characters`
are the rest word characters not captured by mnemonic like:

```md
[h]elp
```

At least one character should be present inside square brackets. `remainig-word-characters`
can be an empty string like `[help]` when option or subcommand name is equal to
word inside square brackets.

### I/O streams

I/O streams are devices used to capture input or output from commands.

#### General syntax

All I/O streams are unquoted and written as:

```md
@stdin
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

> Compatibility note: double braces are not used.  
> Escape sequences: `\{`, `\}`, `\:`, `\.`, `\,`, `\<space>`.

All placeholder begin with a single opening curly brace `{` and end with a
closing one `}`:

```md
{placeholder-content}
```

where `placeholder-content` is some special treated text by TlDr parser and
render like:

```md
{file image}
```

Placeholders can provide both argument semantics and
example values, so to be more concrete `placeholder-content` can be specified as:

```md
{placeholder-explanation: example-values}
```

where `placeholder-explanation` is a some text explaining what placeholder is
used for and `example-values` are some comma-separated example values which
can be substituted instead of this placeholder. Example:

```md
{file image to process: rose.jpg, cactus.png}
```

It's possible to omit `: example-values` and put just placeholder semantics like

```md
{file image to process}
```

Spacing inside `placeholder-explanation` doesn't matter, all spaces are replaced
by one underscore while rendering. Almost the same happens with `example-values`,
all unescaped spaces are replaced by one space while render. It means that
`my  rose.jpg` in:

```md
{file image to process: my  rose.jpg}
```

will be rendered as `my rose.jpg`.

Placeholder nesting is not supported now.

#### Primitive placeholders

Placeholder explanation always begins with a keyword which determines what kind
placeholder is. The following keywords are supported:

- `bool`: boolean value
- `int`: integer value, value range is defined by an explaned tool
- `float`: float value, value range is defined by an explaned tool
- `char`: character value
- `string`: string value
- `command`: executable value
- `file`: relative regular file path value
- `directory`: relative directory path value
- `path`: relative path value
- `/file`: absolute regular file path value
- `/directory`: absolute directory path value
- `/path`: absolute path value
- `/?file`: relative or absolute regular file path value (syntax sugar)
- `/?directory`: relative or absolute directory path value (syntax sugar)
- `/?path`: relative or absolute path value (syntax sugar)
- `any`: anything

`any` is used for placeholders those accept all types of arguments listed above
this keyword while `path` is a combinational meaning of `file` and `directory`
keywords.

Example:

```md
sleep {int seconds: 2}{char suffix: s, m, h, d}
```

String, file, directory, path and any placeholders are always rendered inside double
quotes.

If there are two dots between two integers without spaces around it in `placeholder-explanation`
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

> Compatibility note: `path/to/file_or_directory` and `/path/to/file_or_directory`
> are not used.

All placeholders rendered a little bit differently to keep almost the same user
experience as it was before placeholder standardization:

- `{bool some text}` is rendered as `some_text`
- `{int some text}` is rendered as `some_text`
- `{float some text}` is rendered as `some_text`
- `{char some text}` is rendered as `some_text`
- `{string some text}` is rendered as `some_text`
- `{command some text}` is rendered as `some_text`
- `{file some text}` is rendered as `path/to/some_text_file`
- `{directory some text}` is rendered as `path/to/some_text_directory`
- `{path some text}` is rendered as `path/to/some_text_file|path/to/some_text_directory`
- `{/file some text}` is rendered as `/path/to/some_text_file`
- `{/directory some text}` is rendered as `/path/to/some_text_directory`
- `{/path some text}` is rendered as `/path/to/some_text_file|/path/to/some_text_directory`
- `{/?file some text}` is rendered as `path/to/some_text_file`
- `{/?directory some text}` is rendered as `path/to/some_text_directory`
- `{/?path some text}` is rendered as `path/to/some_text_file|path/to/some_text_directory`
- `{any some text}` is rendered as `some_text`

Spaces can be left as they were, without replacing with underscores.

#### Primitive placeholder directives

Directives are contructs used to modify written examples while page rendering.
They are used to make pages more dymanic and provide current available data
from the operating system or examples.

##### General syntax

> Escape sequences: `\@`.

All directives begin with a single `@` character followed by a directive name:

```md
@directive example
```

where `directive` is a directive name and `example` is an example for a placeholder.

##### Directives

The following directives are supported:

- `@shuffle`: shuffle example characters like `@shuffle abc`
- `@random-bool`: get random bool
- `@random-int`: get random int
- `@random-float`: get random float
- `@random-char`: get random char
- `@random-string`: get random string

#### Optional primitive placeholders

Placeholders can be optional meaning that the corresponding argument may or may
not be provided. To make a placeholder optional put a question mark `?` after
it's keyword like `{file? image: rose.jpg}`.

#### Optional primitive placeholder rendering

Optional primitive placeholders are rendered the same as primitive ones except
different coloring by default.

#### Repeated primitive placeholders

> Compatibility note: `...` is not used.

Primitive placeholders also can accept more than one argument. For this purpose
repetition syntax was created. The following quantifiers are supported:

- `*`: accept 0 or more arguments like `{file* image: rose.jpg}`
- `+`: accept 1 or more arguments like `{file+ image: rose.jpg}`
- `{from}..{to}`: accept `from` to `to` arguments like `{file 2..10 image: rose.jpg}`
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

Better TlDr solves this issue by requiring semantic to be always present, while
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
is unavailable in Better TlDr and maintainers must use one of the following equivalents:

```md
{file+ excluded file|directory+ excluded directory}
```

or:

```md
{file+ excluded file|directory+ directory}
```

##### Not used generalized command syntax

TlDr contributors sometimes prefer write concrete placeholders and not to use
ellipsis construct available for such purposeses like:

```md
tar cf {{target.tar}} {{file1}} {{file2}} {{file3}}
```

The problem it's not possible to tell how much file broken (invalid syntax is used,
it should begin with `path/to/`) arguments are expected: 1, 2, 3 or more? Better TlDr
solves this problem by mandating describing general command syntax:

```md
`tar cf {/?file archive: target.tar} {/?path+ input}`
```

while providing sample values too.

## Best practices

- Always add mnemonics when you know where to add them.
- Use repetition quantifiers where variable number of arguments expected.
  Tell users what command can accept and not it accepts in some example.
  For instance instead of `tar cf {/?file archive: target.tar} {/?file first input} {/?file second input}`
  use `tar cf {/?file archive: target.tar} {/?path+ input}`.

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

- Replace all "apple" (basic regex) occurrences with "mango" (basic regex) in all input lines and display a result:

`{command input command} | sed 's/{string search string: apple}/{string replacement string: mango}/g'`

- Execute a specific script [f]ile:

`{command input command} | sed -f {/?path script: script.sed}`

- Replace all `apple` (extended regex) occurrences with `APPLE` (extended regex) in all input lines and print the result to `stdout`:

`{command input command} | sed -E 's/{string search string: (apple)}/\U\1/g'`

- Print just a first line to `stdout`:

`{command input command} | sed -n '{int line count: 1}p'`

- Replace all `apple` (basic regex) occurrences with `mango` (basic regex) in a `file` and save a backup of the original to `file.bak`:

`sed -i bak 's/{string search string: apple}/{string replacement string: mango}/g' {/?file input file}`
```

[`tar`](https://github.com/tldr-pages/tldr/blob/main/pages/common/tar.md) will be rewritten as:

```md
# tar

> Archiving utility
> Often combined with a compression method, such as gzip or bzip2
> More information: https://www.gnu.org/software/tar

- [c]reate an archive and write it to a [f]ile:

`tar cf {/?file archive: target.tar} {/?path+ input}`

- [c]reate a g[z]ipped archive and write it to a [f]ile:

`tar czf {/?file archive: target.tar.gz} {/?path+ input}`

- [c]reate a g[z]ipped archive from a directory using relative paths:

`tar czf {/?file archive: target.tar.gz} --directory={directory input} .`

- E[x]tract a (compressed) archive [f]ile into the current directory [v]erbosely:

`tar xvf {/?file archive: source.tar.gz, source.tar.bz2, source.tar.xz}`

- E[x]tract a (compressed) archive [f]ile into the target directory:

`tar xf {/?file archive: source.tar.gz, source.tar.bz2, source.tar.xz} --directory={directory target}`

- [c]reate a compressed archive and write it to a [f]ile, using [a]rchive suffix to determine the compression program:

`tar caf {/?file archive: target.tar.xz} {/?path+ input}`

- Lis[t] the contents of a tar [f]ile [v]erbosely:

`tar tvf {/?file archive: source.tar}`

- E[x]tract files matching a pattern from an archive [f]ile:

`tar xf {/?file archive: source.tar} --wildcards "{string glob: *.html}"`
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
