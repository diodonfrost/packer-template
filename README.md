# Packer-template with many hypervisor using ansible provisioner

Provide packer template for many hypervisor and OS

## Requirements for build images

*   Packer 1.2.2
*   Ansible 2.4
*   qemu-kvm (kvm image build)
*   virtualbox (ova virtualbox image build)
*   vmware (vmware player requirement)

## Requirements for use vmware esxi

First you need install ovf-tools on the host where you run packer:

    https://my.vmware.com/fr/web/vmware/details?productId=614&downloadGroup=OVFTOOL420

On vmware esxi you need enable "Guest IP Hack", run the following command on the esxi host:

    esxcli system settings advanced set -o /Net/GuestIPHack -i 1

Packer connect to the vm using VNC, you need open port on vmware esxi.

Ensure you can edit firewall rules:

    chmod 644 /etc/vmware/firewall/service.xml
    chmod +t /etc/vmware/firewall/service.xml

Edit file /etc/vmware/firewall/servic.xml and add at the end:

    <service id="1000">
      <id>packer-vnc</id>
      <rule id="0000">
      <direction>inbound</direction>
      <protocol>tcp</protocol>
      <porttype>dst</porttype>
      <port>
        <begin>5900</begin>
        <end>6000</end>
      </port>
      </rule>
      <enabled>true</enabled>
      <required>true</required>
    </service>

At the end, restore the permission and reload the firewall:

    chmod 444 /etc/vmware/firewall/service.xml
    esxcli network firewall refresh

## Usage

Make sure all the required software (listed above) is installed, then cd to the root project directory, and run:

    Centos 7:

    $ packer build packer-json/kvm/centos-7.json

    Ubuntu 16.04:

    $ packer build packer-json/kvm/ubuntu-16.04.json

    Debian 9:

    $ packer build packer-json/kvm/debian-9.json

You can also build image with another hypervisor:

    Centos 7:

    $ packer build packer-json/virtualbox/centos-7.json

    Ubuntu 16.04:

    $ packer build packer-json/virtualbox/ubuntu-16.04.json

    Debian 9:

    $ packer build packer-json/virtualbox/debian-9.json


## License
GNU GPL 3

## Resources
[https://www.packer.io/docs/builders/index.html](https://www.packer.io/docs/builders/index.html)
[http://docs.ansible.com/ansible/latest/modules/modules_by_category.html](http://docs.ansible.com/ansible/latest/modules/modules_by_category.html)
