# {
#     "name": "Kickstarter Template",
#     "version": "0.0.1",
#     "environment": "development",
#     "author": "Christian Langer",
#     "created": "20180803",
#     "changed": "20180803"
# }

# [OPTIONS]
# Full documentation: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/installation_guide/s1-kickstart2-options

# Where to find installation medium
cdrom
# url --url <url>

# perform installation in text mode
text

# logging the installation
# logging·[--host=<host>]·[--port=<port>]·[--level=debug|info|error|critical]
logging --level=debug

# setting up networking static vs dhcp
# network --activate --bootproto=static --ip=<IP> --netmask=<netmask> --gateway=<GW> [--nameserver=<ns>|--nameserver=<ns>] --onboot=yes --noipv6
network --activate --bootproto=dhcp --onboot=yes --noipv6 --hostname=packer-test.cloud

# reset possible old partions

clearpart --all
zerombr

# use only sda disk, ignore anything else
ignoredisk --only-use=sda

# setting up bootloader
# generated password with grub-mkpasswd-pbkdf2
bootloader --location=mbr --append="noipv6" --iscrypted --password=grub.pbkdf2.sha512.10000.14BA52D36FF3E0B78AE553065FD7DFEDE10738A90DEEE984C75E86F6EF5DA0C10B034FCB1DFE4AB76A6A58306A3E474C0520422AED8CD1A19C722363E41B4048.36632BEE23CFB7D4B66A5F18CA56482942493832665BB27C567FC9D35C57C825637B58B147F048E857B089FCB6F39BEE387D01A481F8D92137C40D34D41647BB

# setting up fs layout; size is MB without unit

# setting up /boot
partition /boot --label=boot --asprimary --fstype=ext4  --fsoptions=defaults,noatime,nodev,nosuid --size=512

# setting up PVs; grow to fill rest of sda
partition pv.01 --grow --ondisk=sda

# setting logical volume group
volgroup vg01 pv.01

# setting up lv swap
logvol swap --vgname=vg01 --name=swap --size=512

# setting up /var
logvol /var --vgname=vg01 --name=var --fstype=ext4 --fsoptions=defaults,noatime,noexec,nosuid,nodev --size=2048

# setting root
logvol / --vgname=vg01 --name=root --fstype=ext4 --fsoptions=defaults,noatime --size=1000 --grow

# setting language specifics
lang en_US.UTF-8
keyboard --vckeymap=de-latin1-nodeadkeys

# setup timezone
timezone --utc Europe/Berlin

# setting authconfig
authconfig --enableshadow --passalgo=sha512

# setup selinux
selinux --enforcing

# setting up root account
# generate 16 characters of SALT
# cat /dev/urandom| tr -dc 'a-zA-Z0-9'| fold -w 16 | head -n1
# generate password:
# python -c 'import crypt,getpass; print crypt.crypt(getpass.getpass(), "$6$your_16_car_salt_here")'
rootpw --iscrypted $6$Aza75kMYmKOxKz6x$SOyOUDoEcVpH7JEyHJpQnxZnzNQdRywMouVjM0ovcyGBGZW7ty1SXIdGpj.OQTrVkbdrWYOVTwj5tbvyvDIWt1

user --iscrypted --name=cloud  --uid 10000 --gid 10000 --password=$6$Aza75kMYmKOxKz6x$SOyOUDoEcVpH7JEyHJpQnxZnzNQdRywMouVjM0ovcyGBGZW7ty1SXIdGpj.OQTrVkbdrWYOVTwj5tbvyvDIWt1
# setting up ssh
services --enable="sshd"

# we enable that after cleanupscript
services --disabled="auditd"
# setting up firewall
firewall --enabled --service="sshd"

# rebooting
reboot

# setting up packages
%packages --nobase --excludedocs
@core
openssh-server
# exclude these
-*-firmware
%end

# setting up tmp
%post --log=/root/ks-post.log

# setting up tmp
# echo 'tmpfs    /tmp    tmpfs    defaults,noatime,noexec,nosuid,nodev    0    0' >> /etc/fstab

# adding cloud to sudoers
echo 'cloud ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers.d/cloud

# no rDNS lookup for ssh connection
sed -i 's/^[[:space:]]*#*UseDNS[[:space:]]\+yes/UseDNS no/' /etc/ssh/sshd_config
%end
