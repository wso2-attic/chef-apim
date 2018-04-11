#
# Cookbook:: chef-wso2apim
# Recipe:: apply_template
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#
#
#  Copyright (c) 2018, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
#
# WSO2 Inc. licenses this file to you under the Apache License,
# Version 2.0 (the "License"); you may not use this file except
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


#for the default profile

if node["wso2am"]["product_profile"] == "default"
  node["wso2am"]["templates"]["default"].each do |template|
    template "#{node['wso2am']['wso2api_extracted_path']}/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}/#{template["path"]}" do
      source "#{template["path"]}.erb"
      owner node["wso2am"]["user"]
      group node["wso2am"]["group"]
      mode 0644

      variables(
      )

    end

  end
end

if node["wso2am"]["product_profile"] == "keymanager"
  node["wso2am"]["templates"]["keymanager"].each do |template|
    template "#{node['wso2am']['wso2api_extracted_path']}/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}/#{template["path"]}" do
      source "#{template["path"]}.erb"
      owner node["wso2am"]["user"]
      group node["wso2am"]["group"]
      mode 0644

      variables(
      )

    end

  end
end
if node["wso2am"]["product_profile"] == "publisher"
  node["wso2am"]["templates"]["publisher"].each do |template|
    template "#{node['wso2am']['wso2api_extracted_path']}/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}/#{template["path"]}" do
      source "#{template["path"]}.erb"
      owner node["wso2am"]["user"]
      group node["wso2am"]["group"]
      mode 0644

      variables(
      )

    end

  end
end
if node["wso2am"]["product_profile"] == "store"
  node["wso2am"]["templates"]["store"].each do |template|
    template "#{node['wso2am']['wso2api_extracted_path']}/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}/#{template["path"]}" do
      source "#{template["path"]}.erb"
      owner node["wso2am"]["user"]
      group node["wso2am"]["group"]
      mode 0644

      variables(
      )

    end

  end
end

template "#{node["wso2am"]["WebSocketInboundEndpoint_path"]}" do
  owner node["wso2am"]["user"]
  group node["wso2am"]["group"]
  mode 0644
  action :delete
  only_if {node['wso2am']['product_profile'] == 'gateway-manager' || node['wso2am']['product_profile'] == 'gateway-worker'}
end

