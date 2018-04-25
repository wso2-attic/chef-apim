# Copyright (c) 2018, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
# WSO2 Inc. licenses this file to you under the Apache License,
# Version 2.0 (the "License"); you may not use this file except
# in compliance with the License.
# you may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied. See the License for the
# specific language governing permissions and limitations
# under the License.
#
# Cookbook:: chef-wso2apim
# Recipe:: wso2_apim_installation
# Copyright:: 2018, The Authors, All Rights Reserved.

install_path = "#{node['wso2am']['wso2am_file_install_path']}"
wso2api_extracted_path = node['wso2am']['wso2api_extracted_path']
wso2am_dir_name = "#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}"
wso2am_dir = "#{wso2api_extracted_path}/#{wso2am_dir_name}"
bin_path = "#{wso2api_extracted_path}/#{wso2am_dir_name}/bin"

#copy file to cahe path from appache server
remote_file "#{Chef::Config[:file_cache_path]}/#{wso2am_dir_name}.zip" do
  source "#{node['wso2am']['wso2am_file_cache_path']}"
  owner node["wso2am"]["user"]
  group node["wso2am"]["group"]
  mode '0755'
  not_if {::File.exist?(install_path)}
end

#unzip wso2_apim zip file and put into the extracted_path
bash "adding wso2 to #{wso2api_extracted_path}" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
	unzip #{wso2am_dir_name}.zip -d "#{wso2api_extracted_path}"
  EOH
  not_if {::File.exist?(wso2am_dir)}
end

#including the templates changes
include_recipe 'chef-wso2apim::apply_template'




