#!/Bin/Bash
#Script to Automate adding SSH Key of a user to list of machines written by TomerLevy

USERNAME=ubuntu
HOSTS="192.168.151.241 192.168.149.75 192.168.147.49 192.168.156.81 192.168.144.50 192.168.159.253 192.168.149.39 192.168.159.28"
SCRIPT="sudo bash -c 'echo ssh-rsa AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBBBB eamil@example.com >> /home/ubuntu/.ssh/authorized_keys'"
for HOSTNAME in ${HOSTS} ; do
    ssh -l ${USERNAME} ${HOSTNAME} "${SCRIPT}"
done
