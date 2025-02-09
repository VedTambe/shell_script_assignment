Part 1: Account Creation
The script provides the ability to create a new user account with the following steps:

Prompt for New Username: The user is prompted to enter the desired username.
Username Availability Check: The script verifies if the username already exists and exits with an error if it does.
Password Setup: The user is prompted to enter a secure password.
Account Creation: The new user account is created with a home directory.
Success Confirmation: A confirmation message is displayed after a successful creation.
Command: ./user_management.sh -c or ./user_management.sh --create

Part 2: Account Deletion
The script can delete existing user accounts:

Prompt for Username: The user enters the username of the account to be deleted.
Username Check: The script ensures the username exists before deletion.
Home Directory Deletion Option: The user is given the option to delete the home directory along with the account.
Success Confirmation: A message confirms successful deletion.
Command: ./user_management.sh -d or ./user_management.sh --delete

Part 3: Password Reset
The script supports resetting user passwords:

Prompt for Username: The user enters the username whose password needs to be reset.
Username Check: Ensures the username exists.
New Password Setup: The user is prompted for a new password.
Success Confirmation: A message confirms the password has been successfully reset.
Command: ./user_management.sh -r or ./user_management.sh --reset

Part 4: List User Accounts
The script can list all user accounts with corresponding UIDs:

Output Format: The script displays a table-like structure with UIDs and usernames.
Command: ./user_management.sh -l or ./user_management.sh --list
Part 5: Help and Usage Information
The script provides a help section to guide the user on available options and their usage.

Command: ./user_management.sh -h or ./user_management.sh --help

Example Output:

User Account Management Script
Usage: ./user_management.sh [OPTION]

Options:
  -c, --create              Create new user account
  -d, --delete              Delete existing user account
  -r, --reset               Reset user password
  -l, --list                List all user accounts
  -i, --info                Show detailed user information
  -n, --modify-username     Change username
  -u, --modify-uid          Change user UID
  -s, --modify-shell        Change user's default shell
  -h, --help                Show this help message
