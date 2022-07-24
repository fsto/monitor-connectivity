# Network Connectivity Logger

A simple bash script pinging the nearest router and some internet hosts. I'm running this every minute to log my Mac's connectivity.

## Set up crontab on Mac

1. Give `cron` full access to your filesystem
    * `which crontab | pbcopy`
    * `open "x-apple.systempreferences:com.apple.preference.security?Privacy_AllFiles"`
    * Click the 🔒 icon in the bottom left corner
    * Click the ➕ icon below the list on the right
    * Press Cmd+Shift+G
    * Paste your clipboard containing the path to `cron`. Might be something like `/usr/sbin/cron`
    * Select the `cron` binary and press "Open"
1. Install the crontab
    * `cat every-minute.crontab | pbcopy`
    * `crontab -e` (vim) or `EDITOR=nano crontab -e` (nano) or some other editor of your chice
    * Paste the crontab example
        * Edit `<PATH-TO-SCRIPT>`
        * Make sure `PATH` includes `ping`, `awk`, etc.
        * Save
1. Check your `network-connectivity.log` get log messages within a minute.

## Update hosts to ping

Update the `URLS` liss in `print-connectivity.sh`

## Log file size

A rough estimation is that the log file will use 30 mb per checked host and year.