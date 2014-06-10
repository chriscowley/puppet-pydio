####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with pydio](#setup)
    * [What pydio affects](#what-pydio-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with pydio](#beginning-with-pydio)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Overview

Module to install and configure Pydio (Put Your Data In Orbit).

Currently only compatible with RHEL6 (and similar), but in general I have left
hooks in place to allow expansion for other distributions.   

##Module Description

This module only installs/configures Pydio. As a LAMP application however, Pydio
requires PHP and MySQL. To allow for this it depends on Puppetlab's modules for
MySQL and Apache.

If you would prefer not to manage Apache and MySQL then you do not need to. You
really should though.

##Setup

###What pydio affects

* Creates a new yum repository to get the Pydio package
* Installs said package along with its dependencies:
  * php
  * php-gd
  * php-mcrypt
  * php-xml
* SELinux configuration, as defined [here](http://pyd.io/pydio-with-security-enhanced-linux-selinux/)

###Setup Requirements **OPTIONAL**

None

###Beginning with pydio

```
node 'pydioserver' {
  class { 'pydio': }
}
``` 

##Usage

To use with hiera:

site.pp

```
node 'pydioserver' {
  hiera_include('classes')
}
```

pydioserver.example.com.yaml:

```
classes:
  - pydio
  - mysql::server
mysql::server::root_password: S3cr3t-hahaha
mysql::server::databases:
  pydio:
    ensure: present
    charset: utf8
  test:
    ensure: absent
mysql::server::users:
  pydio@localhost:
    ensure: present
    password_hash: '*F3A2A51A9B0F2BE2468926B4132313728C250DBF',
mysql::server::grants:
  pydio@localhost/pydio:
    ensure: present
    privileges: ALL
    table: pydio.*
    user: pydio@localhost
```

##Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module
so people know what the module is touching on their system but don't need to
mess with things. (We are working on automating this section!)

##Limitations

RHEL6+ (and compatible)

##Development

If you have anything to contribute, make pull request on [Github](https://github.com/chriscowley/puppet-pydio)

##Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should consider using changelog). You may also add any additional sections you feel are necessary or important to include here. Please use the `## ` header. 
