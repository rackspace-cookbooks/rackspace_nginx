#
# Cookbook Name:: rackpsace_nginx
# Recipe:: common/dir
#
# Author:: AJ Christensen <aj@junglist.gen.nz>
# Author:: Jason Nelson (<jason.nelson@rackspace.com>)
#
# Copyright 2008-2013, Opscode, Inc.
# Copyright 2014. Rackspace, US Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

directory node['rackspace_nginx']['config']['dir'] do
  owner     'root'
  group     'root'
  mode      '0755'
  recursive true
end

directory node['rackspace_nginx']['config']['log_dir'] do
  mode      '0755'
  owner     node['rackspace_nginx']['config']['user']
  action    :create
  recursive true
end

directory File.dirname(node['rackspace_nginx']['config']['pid']) do
  owner     'root'
  group     'root'
  mode      '0755'
  recursive true
end

%w( sites-available sites-enabled conf.d ).each do |leaf|
  directory File.join(node['rackspace_nginx']['config']['dir'], leaf) do
    owner 'root'
    group 'root'
    mode  '0755'
  end
end
