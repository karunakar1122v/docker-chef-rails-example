#
# Cookbook Name:: example-cookbook
# Recipe:: data-volume
#

include_recipe 'docker'

docker_image 'ubuntu' do
  tag 'data-volume'
  source 'https://raw.githubusercontent.com/austenito/docker-chef-rails-example/master/cookbooks/example-cookbook/data-volume/Dockerfile'
  action :build_if_missing
end

docker_container 'data-volume' do
  image 'ubuntu:data-volume'
  container_name 'data-volume'
  detach true
  action :run
end
