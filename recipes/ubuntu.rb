#
# Cookbook Name:: autofs
# Recipe:: ubuntu
#
# Copyright ModCloth, Inc.
#
# All rights reserved - Do Not Redistribute
#

package 'autofs5' do
  action :install
end

service 'autofs' do
  supports [ :enable, :disable, :restart ]
  action [ :enable ]
end

cookbook_file '/etc/auto.master' do 
  source 'auto_master'
  notifies :restart, resources(:service => 'autofs'), :immediately
end

