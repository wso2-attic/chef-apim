#  Copyright (c) 2018, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
#
# WSO2 Inc. licenses this file to you under the Apache License,
#  Version 2.0 (the "License"); you may not use this file except
# in compliance with the License.
#      you may obtain a copy of the License at
#   http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing,
#      software distributed under the License is distributed on an
#  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
#  KIND, either express or implied. See the License for the
# specific language governing permissions and limitations
# under the License.
# Cookbook:: chef-wso2apim
# Recipe:: apply_template
#
# Copyright:: 2018, The Authors, All Rights Reserved.

wso2am_dir_name = "#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}"
bin_path = "#{node['wso2am']['wso2api_extracted_path']}/#{wso2am_dir_name}/bin"

#apply templates for the default profile
if node["wso2am"]["product_profile"] == "default"
  node["wso2am"]["templates"]["default"].each do |template|
    template "#{node['wso2am']['wso2api_extracted_path']}/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}/#{template["path"]}" do
      source "#{template["path"]}.erb"
      owner node["wso2am"]["user"]
      group node["wso2am"]["group"]
      mode 0644

      variables(
      )
      notifies :run, 'execute[wso2amservice_stop]', :delayed
      notifies :run, 'execute[wso2amservice_start]', :delayed

    end
  end
end

#apply templates for the keymanager profile
if node["wso2am"]["product_profile"] == "keymanager"
  node["wso2am"]["templates"]["keymanager"].each do |template|
    template "#{node['wso2am']['wso2api_extracted_path']}/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}/#{template["path"]}" do
      source "#{template["path"]}.erb"
      owner node["wso2am"]["user"]
      group node["wso2am"]["group"]
      mode 0644

      variables(
      )
      notifies :run, 'execute[wso2amservice_stop]', :delayed
      notifies :run, 'execute[wso2amservice_start]', :delayed

    end
  end
  node["wso2am"]["delete_files"]["keymanager"].each do |files|
    file "#{node['wso2am']['wso2api_extracted_path']}/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}/#{files["path"]}" do
      owner node["wso2am"]["user"]
      group node["wso2am"]["group"]
      mode 0644
      action :delete
      notifies :run, 'execute[wso2amservice_stop]', :delayed
      notifies :run, 'execute[wso2amservice_start]', :delayed

    end

  end
end

#apply templates for the publisher profile
if node["wso2am"]["product_profile"] == "publisher"
  node["wso2am"]["templates"]["publisher"].each do |template|
    template "#{node['wso2am']['wso2api_extracted_path']}/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}/#{template["path"]}" do
      source "#{template["path"]}.erb"
      owner node["wso2am"]["user"]
      group node["wso2am"]["group"]
      mode 0644

      variables(
      )
      notifies :run, 'execute[wso2amservice_stop]', :delayed
      notifies :run, 'execute[wso2amservice_start]', :delayed

    end
  end
  node["wso2am"]["delete_files"]["publisher"].each do |files|
    file "#{node['wso2am']['wso2api_extracted_path']}/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}/#{files["path"]}" do
      owner node["wso2am"]["user"]
      group node["wso2am"]["group"]
      mode 0644
      action :delete
      notifies :run, 'execute[wso2amservice_stop]', :delayed
      notifies :run, 'execute[wso2amservice_start]', :delayed

    end
  end
end

#apply templates for the traficmanager profile
if node["wso2am"]["product_profile"] == "traficmanager"
  node["wso2am"]["templates"]["traficmanager"].each do |template|
    template "#{node['wso2am']['wso2api_extracted_path']}/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}/#{template["path"]}" do
      source "#{template["path"]}.erb"
      owner node["wso2am"]["user"]
      group node["wso2am"]["group"]
      mode 0644

      variables(
      )
      notifies :run, 'execute[wso2amservice_stop]', :delayed
      notifies :run, 'execute[wso2amservice_start]', :delayed

    end
  end
  node["wso2am"]["delete_files"]["traficmanager"].each do |files|
    file "#{node['wso2am']['wso2api_extracted_path']}/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}/#{files["path"]}" do
      owner node["wso2am"]["user"]
      group node["wso2am"]["group"]
      mode 0644
      action :delete
      notifies :run, 'execute[wso2amservice_stop]', :delayed
      notifies :run, 'execute[wso2amservice_start]', :delayed

    end
  end
  node["wso2am"]["delete_directory"]["traficmanager"].each do |directory|
    directory "#{node['wso2am']['wso2api_extracted_path']}/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}/#{directory["path"]}" do
      owner node["wso2am"]["user"]
      group node["wso2am"]["group"]
      mode 0644
      recursive true
      action :delete
      notifies :run, 'execute[wso2amservice_stop]', :delayed
      notifies :run, 'execute[wso2amservice_start]', :delayed

    end
  end


end

#apply templates for the store profile
if node["wso2am"]["product_profile"] == "store"
  node["wso2am"]["templates"]["store"].each do |template|
    template "#{node['wso2am']['wso2api_extracted_path']}/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}/#{template["path"]}" do
      source "#{template["path"]}.erb"
      owner node["wso2am"]["user"]
      group node["wso2am"]["group"]
      mode 0644

      variables(
      )
      notifies :run, 'execute[wso2amservice_stop]', :delayed
      notifies :run, 'execute[wso2amservice_start]', :delayed


    end

  end
  node["wso2am"]["delete_files"]["store"].each do |files|
    file "#{node['wso2am']['wso2api_extracted_path']}/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}/#{files["path"]}" do
      owner node["wso2am"]["user"]
      group node["wso2am"]["group"]
      mode 0644
      action :delete

      notifies :run, 'execute[wso2amservice_stop]', :delayed
      notifies :run, 'execute[wso2amservice_start]', :delayed
    end


  end

end

#apply templates for the gateway-manager profile
if node["wso2am"]["product_profile"] == "gateway-manager"
  node["wso2am"]["templates"]["gateway-manager"].each do |template|
    template "#{node['wso2am']['wso2api_extracted_path']}/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}/#{template["path"]}" do
      source "#{template["path"]}.erb"
      owner node["wso2am"]["user"]
      group node["wso2am"]["group"]
      mode 0644

      variables(
      )
      notifies :run, 'execute[wso2amservice_stop]', :delayed
      notifies :run, 'execute[wso2amservice_start]', :delayed

    end

  end
  node["wso2am"]["delete_files"]["gateway-manager"].each do |files|
    file "#{node['wso2am']['wso2api_extracted_path']}/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}/#{files["path"]}" do
      owner node["wso2am"]["user"]
      group node["wso2am"]["group"]
      mode 0644
      action :delete
      notifies :run, 'execute[wso2amservice_stop]', :delayed
      notifies :run, 'execute[wso2amservice_start]', :delayed


    end

  end

end

#apply templates for the gateway-worker profile
if node["wso2am"]["product_profile"] == "gateway-worker"
  node["wso2am"]["templates"]["gateway-worker"].each do |template|
    template "#{node['wso2am']['wso2api_extracted_path']}/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}/#{template["path"]}" do
      source "#{template["path"]}.erb"
      owner node["wso2am"]["user"]
      group node["wso2am"]["group"]
      mode 0644

      variables(
      )
      notifies :run, 'execute[wso2amservice_stop]', :delayed
      notifies :run, 'execute[wso2amservice_start]', :delayed

    end

  end
  node["wso2am"]["delete_files"]["gateway-worker"].each do |files|
    file "#{node['wso2am']['wso2api_extracted_path']}/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}/#{files["path"]}" do
      owner node["wso2am"]["user"]
      group node["wso2am"]["group"]
      mode 0644
      action :delete
      notifies :run, 'execute[wso2amservice_stop]', :delayed
      notifies :run, 'execute[wso2amservice_start]', :delayed
    end

  end

end

#delete the WebSocketInboundEndpoint.xml file
file "#{node["wso2am"]["WebSocketInboundEndpoint_path"]}" do
  owner node["wso2am"]["user"]
  group node["wso2am"]["group"]
  mode 0644
  action :delete
  notifies :run, 'execute[wso2amservice_stop]', :delayed
  notifies :run, 'execute[wso2amservice_start]', :delayed
  only_if {node['wso2am']['product_profile'] == 'gateway-manager' || node['wso2am']['product_profile'] == 'gateway-worker'}
end

#copy reistry_TM.xml to registry.xml
bash "copy registry file" do
  code <<-EOL
  cp "#{node["wso2am"]["registry.xml_path"]}/registry_TM.xml" "#{node["wso2am"]["registry.xml_path"]}/registry.xml"
  EOL
  notifies :run, 'execute[wso2amservice_stop]', :delayed
  notifies :run, 'execute[wso2amservice_start]', :delayed
  only_if {node['wso2am']['product_profile'] == 'traficmanager'}
end

#copy axis2_TM.xml to axis2.xml
bash "copy axis2_TM.xml to axix2 file" do
  code <<-EOL
  cp "#{node["wso2am"]["axis2.xml_path"]}/axis2_TM.xml" "#{node["wso2am"]["axis2.xml_path"]}/axis2.xml"
  EOL
  notifies :run, 'execute[wso2amservice_stop]', :delayed
  notifies :run, 'execute[wso2amservice_start]', :delayed
  only_if {node['wso2am']['product_profile'] == 'traficmanager'}
end

#stop wso2am server if there any configuration changes for profile except trafic manager
execute 'wso2amservice_stop' do
  command './wso2server.sh stop'
  cwd "#{bin_path}"
  action :nothing
  only_if {node['wso2am']['product_profile'] != 'traficmanager'}
end

#start wso2am server if there any configuration changes for profile except trafic manager
execute 'wso2amservice_start' do
  command './wso2server.sh start'
  cwd "#{bin_path}"
  action :nothing
  only_if {node['wso2am']['product_profile'] != 'traficmanager'}
end

#stop wso2am server if there any configuration changes for profile trafic manager
execute 'wso2amservice_start' do
  command './wso2server.sh -Dprofile=traffic-manager stop'
  cwd "#{bin_path}"
  action :nothing
  only_if {node['wso2am']['product_profile'] == 'traficmanager'}
end

#start wso2am server if there any configuration changes for profile  trafic manager
execute 'wso2amservice_start' do
  command './wso2server.sh -Dprofile=traffic-manager start'
  cwd "#{bin_path}"
  action :nothing
  only_if {node['wso2am']['product_profile'] == 'traficmanager'}
end

