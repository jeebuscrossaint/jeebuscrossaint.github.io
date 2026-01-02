# The built in windows tree command is trash

If you are anything like me you are forced to use windows for only a few programs that don't have good linux alternatives. One of the things I hate about windows is the built in tree command. It is slow, ugly, and lacks features.

Already we know us UNIX enthusiasts have a better alternative. The `tree` command on linux is way better than the windows version. It is faster, has more features, and looks better.

The windows version of tree has literally 3 flags and 2 options:


```plaintext
Syntax:
  tree [<drive>:][<path>] [/f] [/a]
```

**Parameters:**

| Parameter   | Description                                                                 |
|-------------|-----------------------------------------------------------------------------|
| `<drive>:`  | Specifies the drive containing the disk for which you want the directory tree. |
| `<path>`    | Specifies the directory to display the structure for.                       |
| `/f`        | Displays the names of the files in each directory.                          |
| `/a`        | Uses text characters instead of graphic lines for subdirectory links.       |
| `/?`        | Displays help at the command prompt.                                        |
/?	Displays help at the command prompt.


Where as the linux version has a ton of options and flags to customize the output to your liking. You can even color code the output based on file types, sizes, and more.
Thats why I wrote my own version of the tree command for windows. It is also just called tree and you can install it via scoop.

```powershell
scoop bucket add tree https://github.com/jeebuscrossaint/tree
scoop update
scoop install tree
```

It is 1:1 feature parity with the linux version of tree besides the html related options as I didn't see a need for them on windows. I doubt anyone would use it on linux anyway.

Here is a list of the features it has:

```console
$ tree --help
```

**Usage:**
```
tree [options] [directory...]
```

**Options:**

| Flag | Description |
|------|-------------|
| `--help` | Outputs a verbose usage listing. |
| `--version` | Outputs the version of tree. |
| `-a` | All files are printed (including hidden files). |
| `-d` | List directories only. |
| `-f` | Prints the full path prefix for each file. |
| `-i` | Makes tree not print the indentation lines. |
| `-l` | Follows symbolic links if they point to directories. |
| `-x` | Stay on the current file-system only. |
| `-P pattern` | List only those files that match the wild-card pattern. |
| `-I pattern` | Do not list those files that match the wild-card pattern. |
| `--noreport` | Omits printing of the file and directory report. |
| `-p` | Print the file type and permissions for each file. |
| `-s` | Print the size of each file in bytes. |
| `-h` | Print the size in human readable format. |
| `-u` | Print the username or UID. |
| `-g` | Print the group name or GID. |
| `-D` | Print the date of last modification. |
| `--inodes` | Prints the inode number. |
| `--device` | Prints the device number. |
| `-F` | Append indicators for file types (`/`, `=`, `*`, `\|`). |
| `-q` | Print non-printable characters as question marks. |
| `-N` | Print non-printable characters as is. |
| `-v` | Sort the output by version. |
| `-r` | Sort the output in reverse alphabetic order. |
| `-t` | Sort the output by last modification time. |
| `--dirsfirst` | List directories before files. |
| `-n` | Turn colorization off always. |
| `-C` | Turn colorization on always. |
| `-A` | Turn on ANSI line graphics. |
| `-S` | Turn on ASCII line graphics. |
| `-L level` | Max display depth of the directory tree. |
| `--filelimit #` | Do not descend directories with more than # entries. |

## Comparison: Default vs Better

Let's see the difference in action. Here's the default Windows tree command output:

**Default Windows Tree:**
![Default Windows Tree Output](posts/assets/tree-default.png)

And here's the improved tree command with better formatting and features:

**Better Tree (Linux-style):**
![Better Tree Output](posts/assets/tree-better.png)

As you can see, the improved version offers:
- **Better visual hierarchy** with clearer indentation and line graphics
- **Color-coded output** that distinguishes between directories, files, and different file types
- **More readable formatting** that's easier to scan at a glance
- **Richer information** when using optional flags for file sizes, permissions, dates, etc.

The default Windows tree command is functional but barebones, while the better version brings all the polish and features you'd expect from a modern CLI tool.
