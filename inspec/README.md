## ACCEPTANCE TEST

![continous delivery](/pictures/continuous-delivery.png)

Inspec is an open-source testing framework for infrastructure with a human- and machine-readable language for specifying compliance, security and policy requirements.

### Installation

You can install inspec with gem and rpm, here we install it.
  With official rpm:

    yum install -y https://packages.chef.io/files/stable/inspec/2.1.54/el/7/inspec-2.1.54-1.el7.x86_64.rpm

  With official deb:

    wget https://packages.chef.io/files/stable/inspec/2.1.83/ubuntu/16.04/inspec_2.1.83-1_amd64.deb && dpkg -i inspec_2.1.83-1_amd64.deb

### Getting started

for run test locally:

    inspec exec spec/

for run test through ssh with private key:

    inspec exec spec/ -t ssh://root@192.168.1.10 -i /path/to/my-ssh-private-key

for run test through ssh with password:

    inspec exec spec/ -t ssh://root@192.168.1.10 --password 'secret'

### Resources

*   Install: [https://www.inspec.io/downloads/](https://www.inspec.io/downloads/)
*   Other examples: [https://github.com/chef/inspec](https://github.com/chef/inspec)
*   Resources reference: [https://www.inspec.io/docs/reference/resources/](https://www.inspec.io/docs/reference/resources/)
