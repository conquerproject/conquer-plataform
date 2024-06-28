# Conquer Project

Welcome to the Conquer Project! I decided to tackle the challenge of creating a cutting-edge Cloud Platform and to develop the applications that will run on it. This project aims to learn and get my hands dirty by applying DevOps practices and getting experience with what we have best in the engineering community.

## About this Repo

This repository is the core of the Conquer Project. It employs GitOps practices to manage and configure the entire cloud infrastructure through code, covering all operational aspects, like continuous deployment and observability.

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
