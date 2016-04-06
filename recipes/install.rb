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

apt_package 'git-core' do
  action :install
end

source_dir = node['redis-twemproxy-agent']['source_dir']

include_recipe 'nodejs'

directory node['redis-twemproxy-agent']['source_dir'] do
  user node['redis-twemproxy-agent']['user']
  group node['redis-twemproxy-agent']['group']
  action :create
end

# get redis-twemproxy-agent
git 'redis-twemproxy-agent' do
  destination node['redis-twemproxy-agent']['source_dir']
  repository node['redis-twemproxy-agent']['git_url']
  reference 'master'
  user node['redis-twemproxy-agent']['user']
  group node['redis-twemproxy-agent']['group']
end

# Install forever package globally
nodejs_npm 'forever' do
  user node['redis-twemproxy-agent']['user']
end

# Install npm packages in the agent source directory
node['redis-twemproxy-agent']['node']['npm_packages'].each do |pkg|
  nodejs_npm pkg do
    path source_dir
  end
end
