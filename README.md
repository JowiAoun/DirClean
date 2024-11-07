# DirClean

### Overview 👀

**DirClean** is a script for categorizing directories & files based on file types. This small project aims to extract best practices in coding, in general. This includes machine-agnostic builds with Docker, CI/CD pipelines, documentation, and clean commit messages.

**DirClean** supports almost all file extensions. All extension categories are defined from the Wikipedia page "[List of file formats](https://en.wikipedia.org/wiki/List_of_file_formats#Vector_graphics)".

### Technologies 🤖

- [Bash](https://www.gnu.org/software/bash/): `sh`-compatible shell full of features & built-ins
- [Docker](https://www.docker.com/): Run tasks (such as lint) on a container, working on any machine
- [GitHub Actions](https://github.com/features/actions): Run workflows to lint, build & push docker image
- [Pre-Commit](https://pre-commit.com/): Run a pre-commit configs locally
- [ShellCheck](https://github.com/koalaman/shellcheck): Tool for picking up warnings & shell script suggestions, run in the pipelines & pre-commit
- [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/): Specification for naming commits

### Configuration ⚙️

Configurating a new location for a file extension can be done by navigating to `config/ext_mapping.txt` and looking up the extension. New file extensions can also be added.

### Motivation 🚵

I received an interview at [Nokia](https://careers.nokia.com/jobs/7750-7250-software-test-infra-student-101668) as a [7750/7250 Software Test Infra Student](https://careers.nokia.com/jobs/7750-7250-software-test-infra-student-101668), had all the technical & intrapersonal skills asked for, but had never wrote a single line of code in a `.sh` file. After the first interview, I had a genuine interest in the *bourne-again shell* and how easy it was to automate tasks with it. Looking around for a problem to solve, I found that my `Downloads/` directory was very unclean, with over a **hundred** different files dating back from 2 years ago! And so, I made this program in one day with the many added tools, and turned my more than a hundred files directory into 5 directories that I could easily organize after running a single command.

I was also very fortunate to receive the internship at Nokia 😃!

### License 📄

This project is under the MIT license. All details are attached within the license.