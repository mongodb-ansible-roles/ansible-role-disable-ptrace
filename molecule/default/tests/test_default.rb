# frozen_string_literal: true

describe file('/etc/sysctl.d/ptrace_scope.conf') do
  it { should exist }
  its('content') { should match(%r{^kernel.yama.ptrace_scope = 0$}) }
end

describe file('/proc/sys/kernel/yama/ptrace_scope') do
  it { should exist }
  its('content') { should match(%r{0}) }
end

describe command('sysctl kernel.yama.ptrace_scope') do
  its('exit_status') { should eq 0 }
  its('stdout') { should eq "kernel.yama.ptrace_scope = 0\n" }
end
