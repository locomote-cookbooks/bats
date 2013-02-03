maintainer       "Locomote"
maintainer_email "devs@locomote.com"
license          "BSD"
description      "Installs bats test framework"
version          "0.2"

%w{redhat centos ubuntu debian gentoo}.each do |os|
  supports os
end
