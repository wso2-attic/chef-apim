default['wso2am']['java_home'] = '/opt/jdk1.8.0_121'
default['wso2am']['mysql_address'] = 'localhost'
default['wso2am']['product_path'] = '/mnt'
default['wso2am']['product_name'] = 'wso2am'
default['wso2am']['product_version'] = '2.1.0'
default['wso2am']['server_ports_offset'] = "1"
default['wso2am']['enable_secure_vault'] = false


default['wso2am']['wso2am_home'] = nil
default['wso2am']['java_extracted_path'] = '/opt'
default['wso2am']['java_file_cache_path'] = 'http://10.100.4.252:8090/api/jdk-8u121-linux-x64.tar.gz'
default['wso2am']['java_file_install_path'] = '~/Downloads/jdk/jdk-8u121-linux-x64.tar.gz'
default['wso2am']['java_zipfile_name'] = 'jdk-8u121-linux-x64.tar.gz'


default['wso2am']['wso2am_file_install_path'] = "~/Downloads/wso2apii/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}.zip"
default['wso2am']['wso2am_file_cache_path'] = "http://10.100.4.252:8090/api/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}.zip"
default['wso2am']['wso2api_extracted_path'] = '/mnt'
default['wso2am']['set_etc_environment'] = true
default['wso2am']['product_install_dir'] = "/home/tharmini/Downloads/#{node['wso2am']['product_name']}"


default['wso2am']['hostname'] = 'localhost'
default['wso2am']['mgt_hostname'] = 'localhost'

default['wso2am']['key_store_location'] = 'repository/resources/security/wso2carbon.jks'
default['wso2am']['key_store_type'] = 'JKS'
default['wso2am']['key_store_password'] = 'wso2carbon'
default['wso2am']['key_store_key_alias'] = 'wso2carbon'
default['wso2am']['key_store_key_password'] = 'wso2carbon'

default['wso2am']['registry_key_store_location'] = 'repository/resources/security/wso2carbon.jks'
default['wso2am']['registry_key_store_type'] = 'JKS'
default['wso2am']['registry_key_store_password'] = 'wso2carbon'
default['wso2am']['registry_key_store_key_alias'] = 'wso2carbon'
default['wso2am']['registry_key_store_key_password'] = 'wso2carbon'

default['wso2am']['trust_store_location'] = 'repository/resources/security/client-truststore.jks'
default['wso2am']['trust_store_type'] = 'JKS'
default['wso2am']['trust_store_password'] = 'wso2carbon'

default['wso2am']['trust_store_location'] = 'repository/resources/security/client-truststore.jks'
default['wso2am']['trust_store_type'] = 'JKS'
default['wso2am']['trust_store_password'] = 'wso2carbon'


default['wso2am']['dep_sync_enabled'] = false
default['wso2am']['product_profile'] = 'keymanager'
default['wso2am']['registry_mounts'] = 'true'
default['wso2am']['wso2registry'] = 'wso2registry'

default['wso2am']['dep_sync_enabled'] = 'false'
default['wso2am']['dep_sync_auto_commit'] = 'true'
default['wso2am']['dep_sync_auto_checkout'] = 'true'
default['wso2am']['dep_sync_repository_type'] = 'svn'
default['wso2am']['dep_sync_svn_url'] = 'https://svn.wso2.org/'
default['wso2am']['dep_sync_svn_user'] = 'svnuser'
default['wso2am']['dep_sync_svn_password'] = 'xxxx'
default['wso2am']['dep_sync_svn_append_tenant_id'] = 'true'

default['wso2am']['user'] = 'wso2user'
default['wso2am']['group'] = 'wso2user'
default['wso2am']['user_shell'] = '/bin/sh'
default['wso2am']['user_comment'] = 'WSO2 User'


default['wso2am']['distributed setup'] = 'true'

default["govregistry"] =
    {
        "name" => 'govregistry',
        "jndi_config" => 'jdbc/WSO2REG_DB',
        "username" => 'root',
        "url" => "jdbc:mysql://#{node['wso2am']['mysql_address']}:3306/regdb",
        "readOnly" => false,
        "enableCache" => true,
        "registryRoot" => '/',
        "path" => '/_system/governance',
        "targetPath" => '/_system/governance'

    }


default["configregistry"] =
    {
        "name" => 'configregistry',
        "jndi_config" => 'jdbc/WSO2_CONFIG_DB',
        "username" => 'root',
        "url" => "jdbc:mysql://#{node['wso2am']['mysql_address']}:3306/configdb",
        "readOnly" => false,
        "enableCache" => true,
        "registryRoot" => '/',
        "path" => '/_system/config',
        "targetPath" => '/_system/config'

    }


default["master_datasources"] = {
    "wso2am_db" => {
        "name" => 'WSO2AM_DB',
        "description" => 'The datasource used for the API Manager database',
        "driver_class_name" => 'com.mysql.jdbc.Driver',
        "url" => "jdbc:mysql://#{node['wso2am']['mysql_address']}:3306/apimgtdb?autoReconnect=true",
        "username" => 'root',
        "password" => 'kirianna7',
        "jndi_config" => 'jdbc/WSO2AM_DB',
        "max_active" => '50',
        "max_wait" => '60000',
        "test_on_borrow" => true,
        "default_auto_commit" => false,
        "validation_query" => 'SELECT 1',
        "validation_interval" => '30000'
    },
    "wso2_mb_store_db" => {
        "name" => 'WSO2_MB_STORE_DB',
        "description" => 'The datasource used for message broker database',
        "driver_class_name" => 'com.mysql.jdbc.Driver',
        "url" => "jdbc:mysql://#{node['wso2am']['mysql_address']}:3306/mbstoredb?autoReconnect=true",
        "username" => 'root',
        "password" => 'kirianna7',
        "jndi_config" => 'WSO2MBStoreDB',
        "max_active" => '50',
        "max_wait" => '60000',
        "test_on_borrow" => true,
        "default_auto_commit" => false,
        "validation_query" => 'SELECT 1',
        "validation_interval" => '30000',
    },
    "wso2um_db" => {
        "name" => 'WSO2UM_DB',
        "description" => 'The datasource used by user manager',
        "driver_class_name" => 'com.mysql.jdbc.Driver',
        "url" => "jdbc:mysql://#{node['wso2am']['mysql_address']}:3306/userdb?autoReconnect=true",
        "username" => 'root',
        "password" => 'kirianna7',
        "jndi_config" => 'jdbc/WSO2UM_DB',
        "max_active" => '50',
        "max_wait" => '60000',
        "test_on_borrow" => true,
        "default_auto_commit" => false,
        "validation_query" => 'SELECT 1',
        "validation_interval" => '30000',
    },
    "wso2reg_db" => {
        "name" => 'WSO2REG_DB',
        "description" => 'The datasource used by user manager',
        "driver_class_name" => 'com.mysql.jdbc.Driver',
        "url" => "jdbc:mysql://#{node['wso2am']['mysql_address']}:3306/regdb?autoReconnect=true",
        "username" => 'root',
        "password" => 'kirianna7',
        "jndi_config" => 'jdbc/WSO2REG_DB',
        "max_active" => '50',
        "max_wait" => '60000',
        "test_on_borrow" => true,
        "default_auto_commit" => false,
        "validation_query" => 'SELECT 1',
        "validation_interval" => '30000',
    },
    "wso2am_stats_db" => {
        "name" => 'WSO2AM_STATS_DB',
        "description" => 'The datasource used for getting statistics to API Manager',
        "driver_class_name" => 'com.mysql.jdbc.Driver',
        "url" => "jdbc:mysql://#{node['wso2am']['mysql_address']}:3306/statdb?autoReconnect=true",
        "username" => 'root',
        "password" => 'kirianna7',
        "jndi_config" => 'jdbc/WSO2AM_STATS_DB',
        "max_active" => '50',
        "max_wait" => '60000',
        "test_on_borrow" => true,
        "default_auto_commit" => false,
        "validation_query" => 'SELECT 1',
        "validation_interval" => '30000',
    },
    "wso2am_config_db" => {
        "name" => 'WSO2AM_CONFIG_DB',
        "description" => 'The datasource used by user manager',
        "driver_class_name" => 'com.mysql.jdbc.Driver',
        "url" => "jdbc:mysql://#{node['wso2am']['mysql_address']}:3306/configdb?autoReconnect=true",
        "username" => 'root',
        "password" => 'kirianna7',
        "jndi_config" => 'jdbc/WSO2_CONFIG_DB',
        "max_active" => '50',
        "max_wait" => '60000',
        "test_on_borrow" => true,
        "default_auto_commit" => false,
        "validation_query" => 'SELECT 1',
        "validation_interval" => '30000',
    },

}
default['wso2am']['apply_gateway_specific_configurations'] = 'true'
default["clustering"] = {
    "enabled" => true,
    "membership_scheme" => 'wka',
    "domain" => 'wso2.as.domain',
    "local_member_host" => '10.100.4.252',
    "local_member_port" => '4000',
    "sub_domain" => 'mgt',
    "wka" => {
        "members" => [{

                          "hostname" => '10.100.4.252',
                          "port" => 4000
                      }, {

                          "hostname" => '10.0.2.15',
                          "port" => 4000}]
    }
}


default["wso2am"]["templates"] = {
    "default" => [
        {"path" => 'repository/conf/carbon.xml'},
        {"path" => 'repository/conf/axis2/axis2.xml'},
        {"path" => 'repository/conf/registry.xml'},
        {"path" => 'repository/conf/datasources/master-datasources.xml'},
        {"path" => 'repository/conf/user-mgt.xml'}

    ],
    "keymanager" => [
        {"path" => 'repository/conf/carbon.xml'},
        {"path" => 'repository/conf/axis2/axis2.xml'},
        {"path" => 'repository/conf/registry.xml'},
        {"path" => 'repository/conf/datasources/master-datasources.xml'},
        {"path" => 'repository/conf/user-mgt.xml'},
        {"path" => 'repository/conf/api-manager.xml'}


    ],
    "publisher" => [
        {"path" => 'repository/conf/carbon.xml'},
        {"path" => 'repository/conf/axis2/axis2.xml'},
        {"path" => 'repository/conf/registry.xml'},
        {"path" => 'repository/conf/datasources/master-datasources.xml'},
        {"path" => 'repository/conf/user-mgt.xml'},
        {"path" => 'repository/conf/jndi.properties'},
        {"path" => 'repository/conf/api-manager.xml'}


    ]
}


default["wso2am"]["worker"] = 'false'

default["wso2am"]["broker"] = 'repository/conf'

default["wso2am"]["WebSocketInboundEndpoint_path"] = "#{node['wso2am']['wso2api_extracted_path']}/#{node['wso2am']['product_name']}-#{node['wso2am']['product_version']}/repository/deployment/server/synapse-configs/default/inbound-endpoints/WebSocketInboundEndpoint.xml}"

default["wso2am"]["apply_publisher_specific_configurations"] = true
default["wso2am"]["apply_store_specific_configurations"] = true
default["wso2am"]["apply_gateway_specific_configurations"] = true
default["wso2am"]["api_gateway_environment"]["host"] = 'mgt-gw.dev.wso2.org'
default["wso2am"]["api_gateway_environment"]["port"] = '9444'
default["wso2am"]["api_gateway_environment"]["api_endpoint_host"] = 'gw.dev.wso2.org'
default["wso2am"]["api_gateway_environment"]["api_endpoint_port"] = '8280'
default["wso2am"]["api_gateway_environment"]["secure_api_endpoint_port"] = '8243'
default["wso2am"]["apim_keymanager"]["host"] = 'km.dev.wso2.org'
default["wso2am"]["apim_keymanager"]["port"] = '9444'
default["wso2am"]["apim_traffic_manager"]["host"] = 'tm.dev.wso2.org'
default["wso2am"]["apim_traffic_manager"]["port"] = '9444'
default["wso2am"]["apim_traffic_manager"]["jms_url_port"] = '5672'
default["wso2am"]["key_validator_client_type"] = 'ThriftClient'
default["wso2am"]["enable_thrift_server"] = true
default["wso2am"]["thrift_server_host"] = 'localhost'
default["wso2am"]["enable_data_publisher"] = false
default["wso2am"]["enable_block_condition"] = true
default["wso2am"]["enable_jms_connection_details"] = true
default["wso2am"]["disable_jms_event_parameters"] = false
default["wso2am"]["apim_store"]["host"] = 'store.dev.wso2.org'
default["wso2am"]["apim_store"]["port"] = '9444'
