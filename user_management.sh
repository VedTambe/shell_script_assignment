#!/bin/bash


# Check if script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "Error: This script must be run as root."
    exit 1
fi


# task no 1: Account Creation 
# Function to create new user
create_user() {
    read -p "Enter new username: " username

    # Check if username exists
    if id "$username" &> /dev/null ; then
        echo "Error: Username '$username' already exists."
        exit 1
    fi

    read -sp "Enter password: " password
    echo

    # Create user with home directory
    useradd -m "$username" &> /dev/null

    # Set password
    echo "$username:$password" | chpasswd
    echo "Success: User '$username' created."
}


# task no 2 : for Account Deletion
# Function to delete user
delete_user() {
    read -p "Enter username to delete: " username

    # Check if username exists
    if ! id "$username" &> /dev/null ; then
        echo "Error: Username '$username' does not exist."
        exit 1
    fi

    read -p "Delete home directory? [Y/n] " choice

    if [[ -z "$choice" ]] || [[ "$choice" =~ ^[yY] ]]; then
      # Delete user with home directory
      userdel -r "$username" &> /dev/null
      echo "Success: User '$username' and home directory deleted."
    else
      # Delete user without home directory
      userdel "$username" &> /dev/null
      echo "Success: User '$username' deleted (home directory preserved)."
    fi
}


# task no 3: Password Reset
# Function to reset password
reset_password() {
    read -p "Enter username: " username

    # Check if username exists
    if ! id "$username" &> /dev/null ; then
        echo "Error: Username '$username' does not exist."
        exit 1
    fi

    read -sp "Enter new password: " password
    echo

    # Change password
    echo "$username:$password" | chpasswd
    echo "Success: Password for '$username' reset."
}


# task no 4 : List User Accounts
# Function to list users
list_users() {
    echo "User accounts:"
    echo "------------------"
    echo -e "UID\t Username"
    awk -F: '{ if ($3 >= 1000 && $3 != 65534) print $3 "\t " $1 }' /etc/passwd
}

# task no 5: Help and Usage Information
# Help function
show_usage() {
    echo
    echo "User Account Management Script"
    echo "Usage: $0 [OPTION]"
    echo
    echo "Options:"
    echo "  -c, --create              Create new user account"
    echo "  -d, --delete              Delete existing user account"
    echo "  -r, --reset               Reset user password"
    echo "  -l, --list                List all user accounts"
    echo "  -i, --info                Show detailed user information"
    echo "  -n, --modify-username     Change username"
    echo "  -u, --modify-uid          Change user UID"
    echo "  -s, --modify-shell        Change user's default shell"
    echo "  -h, --help                Show this help message"
    echo
}


# ---------------------- Final Code Execution ---------------------- #
# Handle command line arguments
case "$1" in
    -c|--create) create_user ;;
    -d|--delete) delete_user ;;
    -r|--reset) reset_password ;;
    -l|--list) list_users ;;
    -i|--info) user_info ;;
    -n|--modify-username) modify_username ;;
    -u|--modify-uid) modify_uid ;;
    -s|--modify-shell) modify_shell ;;
    -h|--help) show_usage ;;
    *) echo "Error: Invalid option. Use -h for help."; exit 1 ;;
esac


exit 0
