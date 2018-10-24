# Table of Content
<!-- vim-markdown-toc GFM -->

- [Issues](#issues)
    - [OS independent](#os-independent)
    - [RedHat/Centos](#redhatcentos)
    - [Ubuntu](#ubuntu)
- [ToDo](#todo)
    - [OS independent](#os-independent-1)
    - [RedHat/CentOS](#redhatcentos-1)
        - [7.5](#75)
    - [Ubuntu](#ubuntu-1)
        - [18.04](#1804)
    - [SLES](#sles)
        - [12 SP3](#12-sp3)
- [Links](#links)

<!-- vim-markdown-toc -->

# Issues

## OS independent
## RedHat/Centos
## Ubuntu

# ToDo


## OS independent
- script to remove unwanted/-needed packages
- puppet-agent
  - install puppet agent
  - run puppet jobs e.g. hardening
- cleanup script
  - clear logs and other stuff
- script to install needed cloud specific software
  - jq, cloud-init
- Common Builder settings

## RedHat/CentOS

### 7.5
- Update JSON to use crypted root password
- script to install "auto-update security patches" cron job
- update yum.conf with '''clean_requirements_on_remove=yes'''

## Ubuntu

### 18.04

## SLES

### 12 SP3
- autoyast only partial working (e.g. part scheme not working)


# Links
- [Packer Documentation](https://www.packer.io/docs/index.html "Packer Docs")
- [Some packer templates to get started](https://github.com/upperstream/packer-templates "Upperstream Packer-Templates")
- [Redhat Kickstarter Documentation](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/installation_guide/sect-kickstart-syntax "Redhat Kickstarter Doc")
- [Creating preseed.cfg](https://help.ubuntu.com/lts/installation-guide/arm64/apbs03.html "Creating preseed")
- [Preseed Documentation](https://help.ubuntu.com/lts/installation-guide/arm64/apbs04.html "Preseed")
- [Hash passwords](https://thornelabs.net/2014/02/03/hash-roots-password-in-rhel-and-centos-kickstart-profiles.html)
- [Partman Expert Recipe](https://github.com/xobs/debian-installer/blob/master/doc/devel/partman-auto-recipe.txt)
