#!/bin/bash

BLUE='\033[1;36m'
PURPLE='\033[1;35m'
RESET='\033[0m'
BGREEN='\033[1;32m'
UGREEN='\033[4;32m'
UCyan='\033[4;36m' 
BRED='\033[1;31m'

printf "${BGREEN}Stage files in git.${RESET}\n"

printf "${BLUE}Which files do you want to stage?${RESET}\n"
select fileType in all allWithChanges custom quit; do
    case $fileType in
        all)
            printf "${BGREEN}Adding all files in current directory to git via `${BGREEN}git add .${RESET}${BGREEN}`${RESET}\n"
            git add .
            printf "${BLUE}Commit description:${RESET}\n"
            read commit_description
            git commit -m "${commit_description}"
            printf "${BLUE}All files in current directory staged for commit.\nCommit description: ${RESET}${commit_description}"
            break 2;;
        allWithChanges)
            printf "${BGREEN}Adding all changed files in current directory to git via ${BGREEN}git add -A${RESET}${BGREEN}${RESET}\n"
            git add -a
            printf "${BLUE}Commit description:${RESET}\n"
            read commit_description
            git commit -m "${commit_description}"
            printf "${BLUE}All files with changes in current repository staged for commit.\nCommit description: ${RESET}${commit_description}"
            break 2;;
        custom)
            printf "${BLUE}Which files/directories do you want to stage for commit? Ex: ./src ./utils/app.ts${RESET}\n"
            read files_and_dirs_to_commit
            git add $files_and_dirs_to_commit
            printf "${BLUE}Commit description:${RESET}\n"
            read commit_description
            git commit -m "${commit_description}"
            printf "${BLUE}Files and/or directories staged for commit.\nCommit description: ${RESET}${commit_description}\n"
            printf "${BLUE}Files/directroies selected: ${files_and_dirs_to_commit}${RESET}"
            break 2;;
    esac
done
