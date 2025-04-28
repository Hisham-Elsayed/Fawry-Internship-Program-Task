# Simple Grep Bash Script

## Overview
This Bash script replicates a simplified version of the `grep` command, supporting basic pattern matching and some command-line options. It allows users to search for patterns inside text files with case-insensitive matching and optional functionalities like line numbering and inverted matching.

## Features
### Pattern Matching
- Search for a string (case-insensitive) inside a specified file.

### Options Supported
- `-n`: Display line numbers along with matching lines.
- `-v`: Invert the match (display lines that do not contain the pattern).
- Combinations like `-vn` and `-nv` are supported and behave the same as using `-v -n`.
- `--help`: Display usage help message.

### Error Handling
- Clear error messages for missing arguments, missing files, and invalid options.
- Displays a help message with usage information when `--help` is used.

## Prerequisites
- Linux-based operating system.
- Basic Bash environment (no additional installations needed).

## Installation
Clone the repository and navigate to the project directory:
```bash
git clone <your-repo-link>
cd <repo-directory>
```
Make the script executable:
```bash
chmod +x mygrep.sh
```

## Usage
Run the script using the following syntax:
```bash
./mygrep.sh [option] pattern filename
```
### Options
- `-n`: Show line numbers for each matching line.
- `-v`: Invert match (show lines that do not contain the pattern).
- `--help`: Display usage help message.

## Script Functions
- **Argument Parsing**: Determines if an option is passed and sets the pattern and filename accordingly.
- **Help Menu**: Displays how to use the script if `--help` is provided.
- **Error Handling**:
  - Missing arguments (pattern or filename).
  - File not found errors.
  - Invalid option handling.
- **Pattern Searching**:
  - Uses `grep` with `-i` (case-insensitive) and optional `-n` and/or `-v` flags based on input.

## Example Outputs
Command:
```bash
./mygrep.sh -vn hello testfile.txt
```
Output:
```
2:This is a test
4:another test line
```
(Shows all lines that do not contain "hello", along with their line numbers.)

## Argument and Option Handling
The script first checks for the number of arguments:
- If no arguments are passed, it exits with an error.
- If `--help` is passed, it shows a help message and exits.
- It checks if the first argument is an option (starts with `-`).
- It correctly parses the option, pattern, and filename.
- If the pattern or filename is missing, it displays specific error messages.
- If a file does not exist, it notifies the user.
- Based on the given option, it uses appropriate `grep` flags for searching the pattern.

## Future Enhancements
If regex support or additional options like `-i`, `-c`, or `-l` were to be added:
- Separate the parsing of options into a dedicated function to manage multiple flags.
- Allow multiple flags to be combined more flexibly (e.g., parsing every character after `-` individually).
- For regex support, use `grep -E` (extended regex) or `grep -P` (Perl regex) instead of simple string matching to allow more powerful pattern searches. Careful validation would be necessary to handle invalid or unintended regex patterns safely.

## Challenges
The hardest part was error handling. Managing missing strings and missing arguments was tricky because the order of `if` conditions matters a lot, and Bash syntax is still new. Debugging the flow when a pattern or filename was missing took time to get right without conflicting checks.

