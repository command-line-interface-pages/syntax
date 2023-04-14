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
  **type**: *string*  
  **required**: *false*  
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

## Page organization

All directory pages should be put in one of the following locations:

- `<os>/<path>/files.yaml`

By default, `<os>` is **common** (applies for all supported operating systems).
`<path>` always equal to described directory. For instance for `/usr/bin/`
page should be put in `linux/usr/bin/files.yaml` while for `/` in
`linux/files.yaml`

## Best practices

We encourage everyone committing to our official repositories to follow best
practices listed below (while for your own repositories you free to decide how
to write pages on your own):

- Always add mnemonics when you know where to add them. When both long and short
  options or commands are presented add mnemonic just for a short option.
- Constantly refer to existing CLI and other kinds of pages via `is` to provide
  file details.

## Page examples

[`/bin`](https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch03s04.html) will be
written as:

```yaml
title: Essential user command binaries
summary:
  type: directory
  description: Commands that may be used by both the system administrator and by users, but which are required when no other filesystems are mounted
  more-information: https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch03s04.html

examples:
  Utility to concatenate files to standard output:
    name: cat
  Utility to change file group ownership:
    name: chgrp
  Utility to change file access permissions:
    name: chmod
  Utility to change file owner and group:
    name: chown
  Utility to copy files and directories:
    name: cp
  Utility to print or set the system data and time:
    name: date
  Utility to convert and copy a file:
    name: dd
  Utility to report filesystem disk space usage:
    name: df
  Utility to print or control the kernel message buffer:
    name: dmesg
  Utility to display a line of text:
    name: echo
  Utility to do nothing, unsuccessfully:
    name: "false"
  Utility to show or set the system's host name:
    name: hostname
  Utility to send signals to processes:
    name: kill
  Utility to make links between files:
    name: ln
  Utility to begin a session on the system:
    name: login
  Utility to list directory contents:
    name: ls
  Utility to make directories:
    name: mkdir
  Utility to make block or character special files:
    name: mknod
  Utility to page through text:
    name: more
  Utility to mount a filesystem:
    name: mount
  Utility to move/rename files:
    name: mv
  Utility to report process status:
    name: ps
  Utility to print name of current working directory:
    name: pwd
  Utility to remove files or directories:
    name: rm
  Utility to remove empty directories:
    name: rmdir
  The `sed' stream editor:
    name: sed
  POSIX compatible command shell:
    name: sh
  Utility to change and print terminal line settings:
    name: stty
  Utility to change user ID:
    name: su
  Utility to flush filesystem buffer:
    name: sync
  Utility to do nothing, successfully:
    name: "true"
  Utility to unmount file systems:
    name: umount
  Utility to print system information:
    name: uname

  The C shell:
    name: csh
    optional: true
  The `ed' editor:
    name: ed
    optional: true
  The tar archiving utility:
    name: tar
    optional: true
  The cpio archiving utility:
    name: cpio
    optional: true
  The GNU compression utility:
    name: gzip
    optional: true
  The GNU uncompression utility:
    name: gunzip
    optional: true
  The GNU uncompression utility:
    name: zcat
    optional: true
  The network statistics utility:
    name: netstat
    optional: true
  The ICMP network test utility:
    name: ping
    optional: true
```
