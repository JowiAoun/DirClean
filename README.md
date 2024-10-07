# DirClean

### Overview 👀

**DirClean** is a script for categorizing directories & files based on file types. This small project aims to extract best practices in coding, in general. This includes machine-agnostic builds with Docker, CI/CD pipelines, documentation, and clean commit messages.

**DirClean** supports almost all file extensions. All extension categories are defined from the Wikipedia page "[List of file formats](https://en.wikipedia.org/wiki/List_of_file_formats#Vector_graphics)".

### Technologies 🤖

- [Bash](https://www.gnu.org/software/bash/): `sh`-compatible shell full of features & built ins
- [Docker](https://www.docker.com/): Run tasks (such as lint) on a container, working on any machine
- [GitHub Actions](https://github.com/features/actions): Run workflows to lint, build & push docker image
- [Pre-Commit](https://pre-commit.com/): Run a pre-commit configs locally
- [ShellCheck](https://github.com/koalaman/shellcheck): Tool for picking up warnings & shell script suggestions, run in the pipelines & pre-commit
- [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/): Specification for naming commits

### Configuration ⚙️

Configurating the new location of a file extension can be done by navigating to `config/ext_mapping` and looking up the extension.

### License 📄

This project is under the MIT license. All details are attached within the license.