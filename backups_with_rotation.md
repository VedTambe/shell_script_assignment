# Automated Backup & Recovery using Cron

## Challenge Description
This challenge involves creating a Bash script that performs automated backups of a specified directory and implements a rotation mechanism to retain only the last 3 backups. The script will:

1. Take a directory path as a command-line argument.
2. Create timestamped backup folders inside the specified directory.
3. Copy all files from the specified directory into the backup folder.
4. Implement a backup rotation mechanism to keep only the last 3 backups by removing the oldest backups if there are more than 3.

## Features
- Timestamped backup folders.
- Automatic cleanup of old backups to retain only the most recent 3 backups.
- Can be scheduled using cron jobs for periodic backups.

## Example Usage
### First Execution (2023-07-30):
```sh
$ ./backup_with_rotation.sh /home/user/documents
```
**Output:**
```
Backup created: /home/user/documents/backup_2023-07-30_12-30-45
Backup created: /home/user/documents/backup_2023-07-30_15-20-10
Backup created: /home/user/documents/backup_2023-07-30_18-40-55
```
**After execution, the directory structure:**
```
/home/user/documents/
├── backup_2023-07-30_12-30-45
├── backup_2023-07-30_15-20-10
├── backup_2023-07-30_18-40-55
├── file1.txt
├── file2.txt
...
```

### Second Execution (2023-08-01):
```sh
$ ./backup_with_rotation.sh /home/user/documents
```
**Output:**
```
Backup created: /home/user/documents/backup_2023-08-01_09-15-30
```
**After execution, the directory structure:**
```
/home/user/documents/
├── backup_2023-07-30_15-20-10
├── backup_2023-07-30_18-40-55
├── backup_2023-08-01_09-15-30
├── file1.txt
├── file2.txt
...
```

## How to Use
1. **Make the script executable:**
   ```sh
   chmod +x backup_with_rotation.sh
   ```
2. **Run the script with the directory to backup:**
   ```sh
   ./backup_with_rotation.sh /path/to/directory
   ```
3. **Schedule using cron for automation:**
   - Open the crontab:
     ```sh
     crontab -e
     ```
   - Add a cron job to run the script daily at midnight:
     ```sh
     0 0 * * * /path/to/backup_with_rotation.sh /path/to/directory
     ```

## Requirements
- Bash shell (Linux/macOS environment)
- Basic file and directory permissions
- Cron (if scheduling is needed)

## Notes
- Ensure the script has proper execution permissions.
- Modify the backup retention count if needed.

## License
This script is open-source and available for modification and distribution.

Happy scripting!


