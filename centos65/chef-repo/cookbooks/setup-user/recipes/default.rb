#
# Cookbook Name:: setup-user
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

group "taro" do
action :create
end

user "taro" do
home "/home/taro"
password '$6$Hyp5FEsdMP.8I1O.$mDSnc1z1tRl/pP5ZEuiDRBWMzTi5pGoSfrYVVuBkq9YyAHBqkcfLkXmO0OVizmfOjoqrjo7EIoCy3VUVt8EKG.'
shell "/bin/bash"
gid "taro"
supports :manage_home => true
action :create
end
