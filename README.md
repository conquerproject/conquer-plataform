# conquer-platform
Welcome to the Conquer Project! In this collaborative effort, three enthusiastic colleagues come together to tackle the challenge of creating a cutting-edge Cloud Platform and the applications that will run on top of it.

## Installation

1 - Clone the repository to your local machine:
```bash
git clone https://github.com/conquerproject/conquer-platform
```

2 - Change to the repository directory:
```bash
cd conquer-platform
```
3 - Install the pre-commit package using pip:
```bash
sudo apt install python3-pip
pip3 install pre-commit --break-system-packages
PATH="$PATH:~/.local/bin"
```
4 - Setting Up Hooks
Once pre-commit is installed, set up the hooks by running the following command in the repository directory:
```bash
cd conquer-platform
pre-commit install
```
Pre-commit hooks are now installed and will automatically run before each commit. If any issues are found, the commit will be blocked until they are resolved.

## Usage
After setting up pre-commit hooks, follow these guidelines:
- When you run git commit, pre-commit hooks will automatically execute.
- If any issues are found, pre-commit will display warnings or errors. Address these issues and commit again.
- You can skip pre-commit checks for a single commit using the --no-verify option: git commit --no-verify.
