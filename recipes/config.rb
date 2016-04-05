#
# Cookbook Name:: redis-twemproxy-agent
# Recipe:: default
#
# Copyright (C) 2016 Rakuten, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

cli_path = File.join(node['redis-twemproxy-agent']['source_dir'], '/lib/cli.js')
log_file = File.join(node['redis-twemproxy-agent']['log_dir'], '/twemproxy.log')

# Create the cli file for the agent
template "#{cli_path}" do
	source 'cli.erb'
	mode '0755'
	variables ({
				:twemproxy_conf => node['redis-twemproxy-agent']['twemproxy_conf'], 
		        :log => "\'#{log_file}\'"
		      })
end

template '/etc/init.d/redis-twemproxy-agent' do
	source 'agent_init.erb'
	mode '0755'
	user node['redis-twemproxy-agent']['user']
	group node['redis-twemproxy-agent']['group']
	variables ({ :path => node['redis-twemproxy-agent']['source_dir'] })
end

service 'redis-twemproxy-agent' do
	provider Chef::Provider::Service::Init
	action :start
end
