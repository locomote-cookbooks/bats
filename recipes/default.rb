if platform? %w{ centos redhat }
  package = "bats-0.2.0-1.noarch.rpm"
  package_path = "#{Chef::Config[:file_cache_path]}/#{package}"

  cookbook_file package_path do
    source package
  end

  rpm_package "bats" do
    source package_path
    action :install
  end
else
  clone_path = "#{Chef::Config[:file_cache_path]}/bats"

  git clone_path do
    repository 'git://github.com/sstephenson/bats.git'
    reference  'master'
    action     :sync
    depth      1
  end

  execute "install in /usr/local" do
    cwd clone_path
    command './install.sh /usr/local'
    not_if "test -f /usr/local/bin/bats"
  end
end
