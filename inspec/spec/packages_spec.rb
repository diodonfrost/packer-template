# Check packages are install or uninstall

# check if packages are installed
if os.family == 'redhat'
  ['chrony', 'kexec-tools'].each do | install |
    describe package(install) do
      it { should be_installed }
    end
  end
end

# check if packages are not installed
['aic94xx-firmware', 'atmel-firmware', 'b43-openfwwf', 'bfa-firmware'].each do | remove |
  describe package(remove) do
    it { should_not be_installed }
  end
end

# check system update
if os.family == 'redhat'
  describe command("yum check-update") do
    its(:exit_status) { should eq 0 }
  end
elsif os.family == 'debian'
  describe command("apt list --upgradable") do
    its(:exit_status) { should eq 0 }
  end
end
