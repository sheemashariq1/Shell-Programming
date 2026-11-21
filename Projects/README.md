# Projects

Small bash scripts that do real system tasks. Each one runs on its own on Linux or WSL.

## Scripts

| Script | What it does |
|---|---|
| Archive.sh | Finds files in a folder that are bigger than 2 KB, compresses them with gzip and moves them to an archive folder. |
| Create_Users.sh | Creates a user account with a random password and asks for a password change on first login. |
| File_System_Status.sh | Checks root disk usage and sends an email alert when it crosses the limit. |
| Monitoring_Free_Ram_Space.sh | Prints a warning when free RAM drops below 500 MB. |
| Shell_Quest.sh | A text-based RPG written in pure Bash. |

## How to run

    chmod +x script_name.sh
    ./script_name.sh

A few scripts need something extra:

- Create_Users.sh must be run with sudo: `sudo ./Create_Users.sh username Full Name`
- File_System_Status.sh needs msmtp set up for Gmail first, then: `./File_System_Status.sh you@example.com`
- Archive.sh takes an optional folder: `./Archive.sh ~/Downloads`