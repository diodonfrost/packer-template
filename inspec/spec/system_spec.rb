# Check kernel params are set

# check if ipv6 is enable
describe kernel_parameter('net.ipv6.conf.all.disable_ipv6') do
  its('value') { should_not eq 1 }
end

describe kernel_parameter('net.ipv6.conf.default.disable_ipv6') do
  its('value') { should_not eq 1 }
end

# SELinux should be enforcing
if os.family == 'redhat'
  describe command ('getenforce') do
    its('stdout') { should match /Enforcing/ }
  end
end
