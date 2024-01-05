# todochecker

a script to use with git mainly. It checks for TODOs in your code and prints them out. I used them with git hooks.

## Usage

Just running `todochecker.sh` will check current location recursively and print todos. if you run `todochecker.sh <word>` then it will search for todo's matching `todo(word)` pattern, ingoring case and space in-between. the script will exit with 0 if none found or 1 if found. I use it in pre-commit and pre-push git hooks searching for `todo(commit)` and `todo(push)` respectively.

To suppress the searching, you can run `source todochecker.sh -s <duration>` which will suppress the checking for `duration` seconds (if none given defaults to 30 second). And if you've suppressed for too long, run `source todochecker.sh -c` to clear the suppression. Just remmeber to use source in these two cases.