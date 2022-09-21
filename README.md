# Bash scripts for frequently used Git commands

## Git Clone
### Setup
1. Edit branch names (line 3, 4) don't edit variable names unless you change all occurances.
2. Edit GitHub username (GitHub ssh must already be enabled on your machine)
3. Run `./gitClone.sh` and follow the prompt

### Usage Examples

<details>
  <summary>Clone from URL</summary>

```bash
./gitClone.sh
Q: Use full git URL?
(y/n): y
Enter the full git URL
<https://github.com/user/repo.git>
Select the branch to use
1) dev_branch
2) main_branch
3) custom
4) quit
Selected <selected branch> branch
Cloning into repo <https://github.com/user/repo.git>
Changing directory => <repo>
Creating branch <selected branch>
Finished cloning into repo <user/repo> and selecting branch <selected branch>
Installing dependencies...
Navigate to new repo by running cd ./<repo>
```
</details>

<details>
  <summary>Clone from repo with non default GitHub username</summary>

```bash
./gitClone.sh
Q: Use full git URL?
(y/n): <n>
Use default GitHub username? (<default username>)
(y/n): <n>
Enter username: 
<username>
Using username: <custom username>
GitHub repo name: 
<repo>
Select branch to clone into.
1) dev_branch
2) main_branch
3) custom
4) quit
<branch number>
Selected <selected branch> branch
Cloning into repo <user/repo>
Changing directory => <repo>
Creating branch <selected branch>
Finished cloning into repo <user/repo> and selecting branch <selected branch>
Installing dependencies...
Navigate to new repo by running cd ./<repo>
```
</details>

<details>
  <summary>Clone from repo name</summary>

```bash
./gitClone.sh
Q: Use full git URL?
(y/n): n
Use default GitHub username? (<default username>)
(y/n): y
Using username: <default username>
GitHub repo name: 
<repo>
Select branch to clone into.
1) dev_branch
2) main_branch
3) custom
4) quit
<branch number>
Selected <selected branch> branch
Cloning into repo <user/repo>
Changing directory => <repo>
Creating branch <selected branch>
Finished cloning into repo <user/repo> and selecting branch <selected branch>
Installing dependencies...
Navigate to new repo by running cd ./<repo>
```
</details>

<details>
  <summary>Clone from repo name, with custom branch name</summary>

```bash
./gitClone.sh
Q: Use full git URL?
(y/n): n
Use default GitHub username? (<default username>)
(y/n): y
Using username: <default username>
GitHub repo name: 
<repo>
Select branch to clone into.
1) dev_branch
2) main_branch
3) custom
4) quit
<3>
Enter branch name:
<custom branch name>
Selected <selected branch> branch
Cloning into repo <user/repo>
Changing directory => <repo>
Creating branch <selected branch>
Finished cloning into repo <user/repo> and selecting branch <selected branch>
Installing dependencies...
Navigate to new repo by running cd ./<repo>
```
</details>

---

## Git Push

### Setup
1. Run `./gitAdd.sh` and follow the prompt

### Usage Examples

<details>
  <summary>Stage all files for commit</summary>

```bash
./gitAdd.sh
Stage files in git.
Which files would you like to stage?
1) all
2) allWithChanges
3) custom
4) quit
<1>
Adding all files in current directory to git via git add .
Commit description:
<commit description>
All files in current directory staged for commit.
Commit description: <commit description>
```
</details>

<details>
  <summary>Stage all changed files for commit</summary>

```bash
./gitAdd.sh
Stage files in git.
Which files would you like to stage?
1) all
2) allWithChanges
3) custom
4) quit
<2>
Adding all changed files in current directory to git via git add -a
Commit description:
<commit description>
ll files with changes in current repository staged for commit.
Commit description: <commit description>
```
</details>

<details>
  <summary>Stage custom files for commit</summary>

```bash
./gitAdd.sh
Stage files in git.
Which files would you like to stage?
1) all
2) allWithChanges
3) custom
4) quit
<3>
Which files/directories do you want to stage for commit? Ex: ./src ./utils/app.ts
<paths to file(s) or directory>
Commit description:
<commit description>
Files and/or directories staged for commit.
Commit description: <commit description>
Files/directroies selected: <paths to file(s) or directory>
```
</details>
