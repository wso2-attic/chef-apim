#
# Cookbook:: chef-wso2apim
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'chef-wso2apim::java_installation'

include_recipe 'chef-wso2apim::wso2_apim_installation'
