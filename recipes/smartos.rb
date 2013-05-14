#
# Cookbook Name:: autofs
# Recipe:: smartos
#
# Copyright ModCloth, Inc.
#
# All rights reserved - Do Not Redistribute
#

service 'svc:/network/rpc/bind:default' do
  supports [ :enable, :disable, :restart ]
  action [ :disable ]
  not_if 'svcs autofs | grep online && grep net /etc/auto_master'
end

service 'svc:/network/rpc/bind:default' do
  supports [ :enable, :disable, :restart ]
  action [ :enable ]
  not_if 'svcs autofs | grep online && grep net /etc/auto_master'
end

service 'autofs' do
  supports [ :enable, :disable, :restart ]
  action [ :enable ]
end

cookbook_file '/etc/auto_master' do 
  source 'auto_master'
  notifies :restart, resources(:service => 'autofs'), :immediately
end

