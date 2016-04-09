# redis-twemproxy-agent-cookbook

Cookbook to set up [redis-twemproxy agent](https://github.com/Stono/redis-twemproxy-agent) to re-configure and restart twemproxy with the updated master on master-change event.

## Supported Platforms

* Ubuntu 14.04

## Attributes

```
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
```

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['redis-twemproxy-agent']['twemproxy_conf']['sentinel']['addr']</tt></td>
    <td>String</td>
    <td>redis-sentinel address</td>
    <td><tt>\'127.0.0.1\'</tt></td>
  </tr>
  <tr>
    <td><tt>['redis-twemproxy-agent']['twemproxy_conf']['sentinel']['port']</tt></td>
    <td>String</td>
    <td>The port redis-sentinel is listening on</td>
    <td><tt>\'23679\'</tt></td>
  </tr>
  <tr>
    <td><tt>['redis-twemproxy-agent']['twemproxy_conf']['twemproxy']['conf_path']</tt></td>
    <td>String</td>
    <td>path to twemproxy configuration file</td>
    <td><tt>'/etc/twemproxy/config.yml\'</tt></td>
  </tr>
  <tr>
    <td><tt>['redis-twemproxy-agent']['twemproxy_conf']['twemproxy']['restart_cmd']</tt></td>
    <td>String</td>
    <td>command to restart twemproxy</td>
    <td><tt>'\'service restart twemproxy\''</tt></td>
  </tr>
</table>

## Usage

### redis-twemproxy-agent::default

Include `redis-twemproxy-agent` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[redis-twemproxy-agent::default]"
  ]
}
```

## License and Authors

Author:: Chandrika Parimoo | Rakuten, Inc. (<chandrika.parimoo@rakops.com>)
