# 42sh - A POSIX-Compliant Shell

Welcome to the public repository for my **42sh** project!

This project is a custom implementation of a UNIX command-line interpreter (shell), heavily inspired by `sh` and `bash`. 

⚠️ **Disclaimer:** *Due to strict academic policies regarding plagiarism (school rules), the actual C source code cannot be made public. Instead, this repository provides the compiled executable (Linux x86_64) along with the complete, exhaustive test suite used to validate the project.*

---

## 🚀 Features & Capabilities

This shell implements a wide array of standard POSIX shell functionalities. Here is a detailed breakdown of what is supported:

### 1. Command Execution
* **Basic Execution:** Executes standard binaries found in the system `$PATH` or via absolute/relative paths.
* **Pipelines (`|`):** Connects the standard output of one command to the standard input of another (e.g., `ls -l | grep ".c" | wc -l`).

### 2. Builtin Commands
The shell includes several internal commands that execute without spawning a new process:
* `cd`: Changes the current working directory.
* `echo`: Prints text to the standard output.
* `export`: Marks environment variables to be passed to child processes.
* `unset`: Removes variable or function names.
* `exit`: Exits the shell with a specific return value.
* `. ` (dot builtin): Reads and executes commands from a file in the current shell environment.

### 3. Redirections
Full support for standard input/output redirections:
* `>` : Redirect standard output (overwrite).
* `>>`: Redirect standard output (append).
* `<` : Redirect standard input.
* `>&` / `<&` : Duplicate file descriptors.
* `>|` : Force redirection (override `noclobber`).

### 4. Control Structures & Loops
* **Conditionals:** `if`, `then`, `elif`, `else`, `fi`.
* **Loops:** * `while` and `until` loops.
  * `for` loops (iterating over lists of items).
* **Loop Control:** `break` and `continue` keywords are fully supported.
* **Negation:** The `!` operator to invert the return value of a pipeline or command.

### 5. Variables & Expansions
* **Variable Assignment:** Creating and updating local and environment variables (e.g., `VAR=value`).
* **Parameter Expansion:** Replacing variables with their values using `$VAR` or `${VAR}`.
* **Special Variables:** Support for variables like `$?` (exit status of the last command).
* **Command Substitution:** Executing a command and replacing it with its standard output using `$(command)` or `` `command` ``.

### 6. Advanced Syntax
* **Functions:** Definition and execution of shell functions.
* **Subshells:** Executing commands in a forked environment using `( command )`.
* **Command Blocks:** Grouping commands in the current shell context using `{ command; }`.

---

## 💻 Getting Started

### Prerequisites
The provided `42sh` binary is compiled for **Linux (x86_64)**. If you are on macOS or Windows, you will need to use a Linux Virtual Machine, Docker, or WSL (Windows Subsystem for Linux).

### Usage
Clone the repository and navigate into the directory:

```bash
git clone https://github.com/louischap31/public_42SH.git
cd 42sh-public
