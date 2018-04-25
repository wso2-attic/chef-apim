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

# Cookbook:: chef-wso2apim
# Recipe:: java_installation
# Copyright:: 2018, The Authors, All Rights Reserved.


install_path = node['wso2am']['java_file_install_path']
java_zip_name = node['wso2am']['java_zipfile_name']
wso2am_user = node['wso2am']['user']
wso2am_group = node['wso2am']['group']
extract_cache_path = node['wso2am']['java_extracted_path']
java_home = node['wso2am']['java_home']

#creating new wso2am_group
group "#{wso2am_group}" do
  action :create
  members #{wso2am_group}
  append true
end

#creating new wso2am user
user "#{wso2am_user}" do
  action :create
  shell '/bin/bash'
  gid node['wso2am']['group']
  comment node['wso2am']['user_comment']
  system true
  manage_home true
end

#downloading the java zip file into file_cache path
remote_file "#{Chef::Config[:file_cache_path]}/#{java_zip_name}" do
  source "#{node['wso2am']['java_file_cache_path']}"
  owner node["wso2am"]["user"]
  group node["wso2am"]["group"]
  mode '0755'
  not_if {::File.exist?(install_path)}
end

#unzip java zip file and put into extracted_path
bash "adding java to #{extract_cache_path}" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
	tar -xvzf #{java_zip_name} -C "#{extract_cache_path}"
  EOH
  not_if {::File.exists?(java_home)}
end

#setting java home
ENV['JAVA_HOME'] = java_home
bash 'env_test' do
  code <<-EOH
  echo $JAVA_HOME
  EOH
end

#setting envirnmental variables in etc environment
ruby_block 'set JAVA_HOME in /etc/environment' do
  block do
    file = Chef::Util::FileEdit.new('/etc/environment')
    file.insert_line_if_no_match(/^JAVA_HOME=/, "JAVA_HOME=#{java_home}")
    file.search_file_replace_line(/^JAVA_HOME=/, "JAVA_HOME=#{java_home}")
    file.write_file
  end
  only_if {node['wso2am']['set_etc_environment']}
end



