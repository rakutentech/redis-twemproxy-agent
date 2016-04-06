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

# node js configuration settings
default['redis-twemproxy-agent']['node']['install_method'] = 'source'
default['redis-twemproxy-agent']['node']['npm_packages'] = ['cli',
                                                            'js-yaml',
                                                            'underscore',
                                                            'async',
                                                            'redis'
                                                           ]

# twemproxy-agent configuration
default['redis-twemproxy-agent']['git_url'] = 'https://github.com/Stono/redis-twemproxy-agent.git' 
default['redis-twemproxy-agent']['user'] = 'root'
default['redis-twemproxy-agent']['group'] = 'root'
default['redis-twemproxy-agent']['source_dir'] = '/opt/redis-twemproxy-agent'
default['redis-twemproxy-agent']['log_dir'] = '/var/log/'

# Twemproxy configuration
# Add quotes to be accepted in cli 
default['redis-twemproxy-agent']['twemproxy_conf'] = {
  'sentinel' => {
    'addr' => "\'127.0.0.1\'",
    'port' => "\'26379\'"
  },
  'twemproxy' => {
      'conf_path' => "\'/etc/twemproxy/config.yml\'",
      'restart_cmd' => "\'service restart twemproxy\'"
  } 
}
