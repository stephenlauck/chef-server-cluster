#
# Cookbook Name:: chef-server-cluster
# Recipes:: metal-clean
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

include_recipe 'chef-server-cluster::metal'

machine 'analytics' do
  action :destroy
end

machine 'frontend' do
  action :destroy
end

machine 'bootstrap-backend' do
  action :destroy
end

directory '/tmp/ssh' do
  recursive true
  action :delete
end

directory '/tmp/stash' do
  recursive true
  action :delete
end
