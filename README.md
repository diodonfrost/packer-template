# Packer-template with many hypervisor using ansible provisioner

provide packer template for many hypervisor and OS

## Requirements for KVM images

*   Packer 1.2.2
*   Ansible 2.4
*   qemu-kvm

## Usage

Make sure all the required software (listed above) is installed, then cd to the root project directory, and run:

    Centos 7:

    $ packer build packer-json/kvm/centos-7.json

    Ubuntu 16.04:

    $ packer build packer-json/kvm/ubuntu-16.04.json

## License
GNU GPL 3

## Resources
[https://www.packer.io/docs/builders/index.html](https://www.packer.io/docs/builders/index.html)
[http://docs.ansible.com/ansible/latest/modules/modules_by_category.html](http://docs.ansible.com/ansible/latest/modules/modules_by_category.html)
