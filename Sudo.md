

```sh
## /etc/sudoers.d/omasudo

## Allow a user to attempt to enter a password 1 times
Defaults        passwd_tries=3

## Custom badpass message
Defaults        badpass_message="This is a custom bad password message"

## logging
Defaults        logfile=/var/log/sudo/log.log
Defaults        log_input,log_output
Defaults		iolog_dir=/var/log/sudo

## Require TTY
Defaults        requiretty

## Secure path
Defaults        secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
```


# To read the output log
cat ttyout | gzip -d
