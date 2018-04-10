##WSO2 API Manager 2.1.0 Chef Cookbook

Chef is a powerful automation platform that transforms infrastructure into code.The Chef Server acts as a hub for configuration data. The Chef Server stores cookbooks, the policies that are applied to nodes, and metadata that describes each registered node that is being managed by Chef.

The  Chef cookbook includes the installation and some  configurations for distributed setup with different profiles such as  distributed database configuration, enable clustering, standalone h2 database configurations, API manager configuration, axis2 configuration,registry configuration, user_manager configurations for WSO2 API manager.


###How to Contribute


This guide provides step by step instructions to configure Chef setup to run the WSO2 products.

Note	:Tested Operating System 
        :Ubuntu 16.04

This document contains instructions specific to ubuntu 16.04 .

####Instructions

 1. Setup two instances
 2. Setup Chef server, Chef client  and workstation and Perform the configurations part to run the product


1. Setup two instances
It can be either two cloud instances or two physical computer instances or two local VM instances.
Set one of the above instances as Chef server as well as Chef workstation and other as Chef-client. You must be able to SSH between both the instances if bootstrapping the node from workstation.

2. Setup Chef server, Chef client  and workstation
First, we install the Chef Server and Chef workstation in one instance and do the configuration part for them. 

Thereafter, we install the Chef client in another instance and configure both  chef server and chef node and also we configuration of Chef workstation and Chef node is carried out if bootstrapping the node from workstation.

 






#### **2.1.Install and configure Chef Server** 
We can install the Chef Server through this link 
“https://learn.chef.io/modules/manage-a-node-chef-server/ubuntu/bring-your-own-system/set-up-your-chef-server#/ “
 
When we install the Chef Server in an instance we have to create an organization and user. In this process you get RSA private key for the user. You need to save the USER.pem (chefadmin.pem) file into a seperate file for knife configuration process.

#### **2.2.Install and configure Chef workstation**
Chef-workstation can be  installed through Chef Development Kit (Chef DK) via  this link (https://downloads.chef.io/chefdk).

Refer this link to the configuration part of workstation (https://docs.chef.io/workstation.html)[1].
When you go through the above  doc you will  find two ways to create the Chef-repo:

Use the starter kit built into the Chef Server web user interface
Manually, by using the chef generate app subcommand in the chef command-line tool that is packaged in the Chef Development Kit

First one is the easiest method when you have access to Chef server (hosted or on premises). There you can download the starter kit. The starter kit will create the necessary configuration files: Chefdirectory, knife.rb, ORGANIZATION-validator.pem, and USER.pem. Simply download the starter kit and then move it to the desired location on your workstation. In the second method, we have to do it manually by creating those files.


After doing the configuration part through [1] link 

Download the chef-apim-master.zip from the (https://github.com/tharmini/chef-apim)
Extract the zip file and copy the chef-wso2apim folder from chef-apim-master to ~/chef-repo/cookbooks/
Now we can upload that  into the Chef-Server by following command in the ~/ chef-repo directory

knife cookbook upload chef-wso2apim

Now we can find the output as below:

Uploading chef-wso2apim  [0.1.0]
Uploaded 1 cookbook.

How to further edit the cookbook

If we want to create a recipe go to ~/chef-repo/cookbooks/chef-wso2apim/  directory and type the following command
	
	chef generate recipe RECIPE_NAME
	Now the newly created recipe is included inside the recipes folder
	
If we want to create a template, go to ~/chef-repo/cookbooks/chef-wso2apim/  directory and type the following command:
	
	chef generate template TEMPLATE_NAME
	Now we the newly created template is included inside the templates folder.

If we want to change the attribute of  templates
	1.create a .erb file in templates folder 
		For eg: Chef generates template carbon.xml
		It will create an axis2.xml.erb file in templates folder
	2.Edit the configurations inside the carbon.xml.erb file by defining dynamic attribute name
		For eg: node["wso2am"]["server_ports_offset"]
	3.Define the dynamic static attributes  in default file inside the attribute folder
 	 ~/chef-repo/cookbooks/chef-wso2apim/attributes/default.rb file and add the template file 
	For eg: default["wso2am"]["server_ports_offset"] = 1
4.For template file we have to mention source template that will be used to create the file, and the permissions needed on that file.


	
We have to add the source  and destination path  into default["templates"] in default.rb inside  attributes folder. 




If we want to create a new cookbook go to ~/chef-repo/cookbooks/ directory and type the following command
	
	chef generate cookbook COOKBOOK_NAME
	Now the newly created COOKBOOK is included inside the cookbooks folder.

If we want to upload files which are below  500mb size, we can directly insert that file into ~/chef-repo/cookbooks/chef-wso2apim/files/ directory. But if the file size is above the 500mb we want to put that file into an external server. We have to change the external server link in attributes file.
	In the above cookbook the external server store the wso2am-2.1.0 and jdk1.8.0_121
packs. If we want to change that version we need to store the newly version packs in external       server and change the  default attribute default['wso2am']['java_file_cache_path'] , default['wso2am']['wso2am_file_cache_path'] and the default['wso2am']['product_version'].
	


When we made changes in cookbook we have to upload the cookbook again into the Chef Server through the previous command in step 3.
	






#### **2.3.How to install and configure Chef-client**
A bootstrap is a process that installs the Chef-client on a target system so that it can run as a Cchef-client and communicate with a Chef Server. There are two ways to do this:
Use the knife bootstrap subcommand to bootstrap a node using the omnibus installer
Use an unattended install to bootstrap a node from itself, without using SSH or WinRM

**2.3.1.Use the knife bootstrap subcommand to bootstrap a node using the omnibus installer**

Through this method, the workstation bootstraps the node through SSH command and push the cookbook from the Chef Server to the node. When using bootstrapping method the node machine doesn’t need to install Chef client. It will automatically install and configure all the functions.

To do this we can be able to SSH with two instances .
We can install the open-SSH server with the following commands

Sudo apt-get update
sudo apt-get install openssh-server

To SSH into the guest VM, first you have to set the forwarded port in VM.(https://blog.johannesmp.com/2017/01/25/port-forwarding-ssh-from-virtualbox/)

**2.3.2.Use an unattended install to bootstrap a node from itself, without using SSH or WinR**

In this way in our Chef-client instance we must install the chef client and do the configuration parts of it. Here the node doesn’t need to connect with the workstation only the chef server.


To install Chef Client on a machine go to the URL (http://www.getchef.com/chef/install/). Select your Operating System, Version and Environment. It will show you the link to download the relevant package.

On Linux you can install through the installer script.The script will download and install the latest version of Chef client on your machine. Follow this link to do the configurations  on Chef-client. (https://medium.com/@tharmini7/chef-client-2eab9a45f10d)














