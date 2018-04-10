#
# Cookbook:: chef-wso2apim
# Recipe:: apply_template
#
# Copyright:: 2018, The Authors, All Rights Reserved.

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

# node["wso2am"]["templates"]["publisher"].each do |template|
#   template "#{node['wso2am']['wso2api_extracted_path']}/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}/#{template["path"]}" do
#     source "#{template["path"]}.erb"
#     owner node["wso2am"]["user"]
#     group node["wso2am"]["group"]
#     mode 0644
#
#     variables(
#     )
#     only_if {node["wso2am"]["profile"] == "publisher"}
#   end
#
# end
#


template "#{node["wso2am"]["WebSocketInboundEndpoint_path"]}" do
  owner node["wso2am"]["user"]
  group node["wso2am"]["group"]
  mode 0644
  action :delete
  only_if {node['wso2am']['product_profile'] == 'gateway-manager' || node['wso2am']['product_profile'] == 'gateway-worker'}
end
