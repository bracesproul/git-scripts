#!/bin/bash

dev_branch=brace-dev
main_branch=main
git_username=bracesproul
BLUE='\033[1;36m'
PURPLE='\033[1;35m'
RESET='\033[0m'
BGREEN='\033[1;32m'
UCyan='\033[4;36m' 
BRED='\033[1;31m'

printf "${BLUE}Use full git URL?\n(y/n)${RESET}"
read full_url_y_n

if [ $full_url_y_n = "y" ]
    then
        printf "${BLUE}Enter the full git URL${RESET}\n"
        read full_git_url
        IFS=/ read -r str1 str2 str3 full_url_username full_url_repo <<< $full_git_url
        IFS=. read -r full_url_repo_name __dot_git__ <<< $full_url_repo

        printf "${BGREEN}Git URL: ${full_git_url}${RESET}\n"
        printf "\n${BLUE}Select branch to use${RESET}\n"
        select newBranch in dev_branch main_branch quit; do
            case $newBranch in
                dev_branch)
                    printf "${BGREEN}Selected ${UCyan}${dev_branch}${RESET} ${BGREEN}branch\n"
                    printf "Cloning into repo: ${UCyan}${full_git_url}${RESET}\n"
                    git clone $full_git_url
                    printf "${BGREEN}changing directory => ${UCyan}${full_url_repo_name}${RESET}\n" 
                    cd $full_url_repo_name
                    printf "${BGREEN}Creating branch: ${UCyan}${dev_branch}${RESET}\n" 
                    git branch $dev_branch
                    git checkout $dev_branch
                    printf "\n${BGREEN}Finished cloning into ${UCyan}${full_url_username}/${full_url_repo_name}${RESET} ${BGREEN}and selecting branch ${UCyan}${dev_branch}${RESET}\n"
                    printf "${BGREEN}Installing dependencies...${RESET}\n"
                    npm install
                    printf "\n${BGREEN}Navigate to new repo by running ${UCyan}cd ./${full_url_repo_name}${RESET}"
                    break 2
                    ;;
                main_branch)
                    printf "${BGREEN}Selected ${UCyan}${main_branch}${RESET} ${BGREEN}branch\n"
                    printf "Cloning into repo: ${UCyan}${full_git_url}${RESET}\n"
                    git clone $full_git_url
                    printf "${BGREEN}changing directory => ${UCyan}${full_url_repo_name}${RESET}\n" 
                    cd $full_url_repo_name
                    printf "${BGREEN}Creating branch: ${UCyan}${main_branch}${RESET}\n" 
                    git branch $main_branch
                    git checkout $main_branch
                    printf "\n${BGREEN}Finished cloning into ${UCyan}${full_url_username}/${full_url_repo_name}${RESET} ${BGREEN}and selecting branch ${UCyan}${main_branch}${RESET}\n"
                    printf "${BGREEN}Installing dependencies...${RESET}\n"
                    npm install
                    printf "\n${BGREEN}Navigate to new repo by running ${UCyan}cd ./${full_url_repo_name}${RESET}"
                    break 2
                    ;;
                quit)
                    printf "${BRED}Exiting script.${RESET}"
                    break 2;;
            esac
        done
    exit 1
fi

printf "${BLUE}Use default GitHub username? (${UCyan}${git_username}${RESET}${BLUE})\n(y/n)${RESET}"
read usernameCheck

if [ $usernameCheck = "y" ]
    then
        printf "\n${BGREEN}Using username: ${UCyan}${git_username}${RESET}\n"
    else
        printf "${BLUE}Enter username: ${RESET}"
        read new_username
        git_username=$new_username
        printf "\n${BGREEN}Using username: ${UCyan}${git_username}${RESET}\n"
    fi

printf "${BLUE}Github repo name: ${RESET}"
read git_repo_name
git_url=$git_username/$git_repo_name

select branch in dev_branch main_branch quit; do
    case $branch in
        dev_branch)
            printf "${BGREEN}Selected ${UCyan}${dev_branch}${RESET} ${BGREEN}branch\n"
            printf "Cloning into repo: ${UCyan}${git_username}/${git_repo_name}${RESET}\n"
            git clone https://github.com/$git_username/$git_repo_name.git
            printf "${BGREEN}changing directory => ${UCyan}${git_repo_name}${RESET}\n" 
            cd $git_repo_name
            printf "${BGREEN}Creating branch: ${UCyan}${dev_branch}${RESET}\n" 
            git branch $dev_branch
            git checkout $dev_branch
            printf "\n${BGREEN}Finished cloning into ${UCyan}${git_url}${RESET} ${BGREEN}and selecting branch ${UCyan}${dev_branch}${RESET}\n"
            printf "${BGREEN}Installing dependencies...${RESET}\n"
            npm install
            printf "\n${BGREEN}Navigate to new repo by running ${UCyan}cd ./${git_repo_name}${RESET}"
            break 2
            ;;
        main_branch)
            printf "${BGREEN}Selected ${UCyan}${main_branch}${RESET} ${BGREEN}branch\n"
            printf "Cloning into repo: ${UCyan}${git_username}/${git_repo_name}${RESET}\n"
            git clone https://github.com/$git_username/$git_repo_name.git
            printf "${BGREEN}changing directory => ${UCyan}${git_repo_name}${RESET}\n" 
            cd $git_repo_name
            printf "${BGREEN}Creating branch: ${UCyan}${main_branch}${RESET}\n" 
            git branch $main_branch
            git checkout $main_branch
            printf "\n${BGREEN}Finished cloning into ${UCyan}${git_url}${RESET} ${BGREEN}and selecting branch ${UCyan}${main_branch}${RESET}\n"
            printf "${BGREEN}Installing dependencies...${RESET}\n"
            npm install
            printf "\n${BGREEN}Navigate to new repo by running ${UCyan}cd ./${git_repo_name}${RESET}"
            break 2
            ;;
        quit)
            echo "Exiting script"
            break 2;;
    esac
done
