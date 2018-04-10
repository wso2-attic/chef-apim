#
# Cookbook:: chef-wso2apim
# Recipe:: connect_template_xml
#
# Copyright:: 2018, The Authors, All Rights Reserved.


node["wso2am"]["templates"].each do |template|
  template "#{node['wso2am']['wso2api_extracted_path']}/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}/#{template["path"]}" do
    source "#{template["path"]}.erb"
    owner node["wso2am"]["user"]
    group node["wso2am"]["group"]
    mode 0644

    variables(
    )
  end
end
