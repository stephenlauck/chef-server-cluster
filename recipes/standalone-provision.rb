#
# Cookbook Name:: chef-server-cluster
# Recipes:: cluster-provision
#
# Author: Joshua Timberman <joshua@getchef.com>
# Copyright (C) 2014, Chef Software, Inc. <legal@getchef.com>
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
# This recipe is run on the provisioner node. It creates all the other nodes using chef-provisioning.

include_recipe 'chef-server-cluster::setup-provisioner'
include_recipe 'chef-server-cluster::setup-ssh-keys'

machine 'standalone' do
  recipe 'chef-server-cluster::standalone'
  ohai_hints 'ec2' => '{}'
  action :converge
  converge true
end
