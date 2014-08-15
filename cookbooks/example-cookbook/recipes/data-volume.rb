#
# Cookbook Name:: example-cookbook
# Recipe:: data-volume
#

include_recipe 'docker'

cookbook_file 'Dockerfile' do
  path '/tmp/Dockerfile'
  source 'data-volume/Dockerfile'
end

docker_image 'ubuntu' do
  tag 'data-volume'
  source '/tmp'
  action :build_if_missing
end

docker_container 'data-volume' do
  image 'ubuntu:data-volume'
  container_name 'data-volume'
  detach true
  action :run
end
