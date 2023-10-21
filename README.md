# studNet Leipzig shell script

(Forked from https://github.com/kinafu)

Hello.

Install the client on a machine running Linux. A low-power client like the Raspberry Pi is recommended.
If you want to stay signed on in StudNET 24/7, the client must be online (=powered on) 24/7, too.

After the installation, StudNET client should autostart upon each boot.
The client runs quietly as a service in the background.

## Installation

    sudo apt update && sudo apt upgrade
    sudo apt install openssh-client sshpass ca-certificates curl unattended-upgrades $additional_packages -y
    nano studnet.sh
    <edit studnet_nr, studnet_nr, known_hosts_filepath, and identity_file_filepath then save changes by ctrl-s then ctrl-x >
    sudo cp studnet.sh /usr/local/bin/studnet.sh
    sudo chmod u+rwx /usr/local/bin/studnet.sh
    sudo cp studnet.service /etc/systemd/system/studnet.service

### Autostart
    systemctl daemon-reload
    systemctl enable studnet.service
### Run manually
    service studnet start

### on raspberry
you can enable watchdog see [here](https://github.com/kinafu/studNET-client/blob/master/installer.sh).

### Credits:
https://github.com/kinafu/studNET-client

https://unix.stackexchange.com/a/654079

https://askubuntu.com/q/936728

