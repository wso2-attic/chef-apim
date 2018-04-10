#
# Cookbook:: chef-wso2apim
# Recipe:: wso2_apim_installation
#
# Copyright:: 2018, The Authors, All Rights Reserved.

install_path = "#{node['wso2am']['wso2am_file_install_path']}"
wso2api_extracted_path = node['wso2am']['wso2api_extracted_path']
product_name = node['wso2am']['product_name']
product_version = node['wso2am']['product_version']
wso2am_dir_name = "#{product_name}-#{product_version}"
wso2am_dir = "#{wso2api_extracted_path}/#{wso2am_dir_name}"
wso2am_bin_name = "#{wso2am_dir_name}/bin"
bin_path = "#{wso2api_extracted_path}/#{wso2am_bin_name}"


remote_file "#{Chef::Config[:file_cache_path]}/#{wso2am_dir_name}.zip" do
  source "#{node['wso2am']['wso2am_file_cache_path']}"
  owner node["wso2am"]["user"]
  group node["wso2am"]["group"]
  mode '0755'
  not_if {::File.exist?(install_path)}
end


#extract wso2 apim
bash "adding wso2 to #{wso2api_extracted_path}" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
	unzip #{wso2am_dir_name}.zip -d "#{wso2api_extracted_path}"
  EOH
  not_if {::File.exist?(wso2am_dir)}
end


include_recipe 'chef-wso2apim::apply_template'


bash "start_wso2_server " do
  code <<-EOH
  	cd #{bin_path}
	./wso2server.sh --start
  EOH
end
