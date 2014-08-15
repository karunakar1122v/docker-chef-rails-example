#
# Cookbook Name:: chef-docker-rails-example
# Recipe::nginx-run
#

include_recipe 'docker'

# how to change your configuration without rebuilding the image?
#
# the configuration needs to live someplace else
#
# where should this file live? in the nginx image? no. It should be in the copy the template to the 
# if i want to change config
#   * shutdown the containers
#   * rebuild the image with the new config
#   *
#
# Copy docker file and nginx config template to tmp
# Build nginx image here. build if missing.
#
# you can fiddle with the config in the data-volume. Do I want to have a nginx volume?

if `sudo docker ps -a | grep nginx`.size > 0
  execute('stop container') { command "docker stop -t 60 nginx" }
  execute('remove container') { command "docker rm -f nginx" }
end

docker_container 'nginx' do
  image 'ubuntu:nginx'
  container_name 'nginx'
  port "80:80"
  link ['rails-example:rails_example']
  volumes_from 'data-volume'
  detach true
  action :run
  command '/config/nginx/run.sh'
end
