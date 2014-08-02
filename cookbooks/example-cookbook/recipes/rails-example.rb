#
# Cookbook Name:: example-cookbook
# Recipe:: rails-example
#

include_recipe 'docker'

if `sudo docker ps -a | grep rails-example`.size > 0
  execute('stop container') { command "docker stop -t 60 rails-example" }
  execute('remove container') { command "docker rm -f rails-example" }
end

docker_container 'rails-example' do
  image 'ubuntu:ruby-2.1.2'
  container_name 'rails-example'
  detach true
  link ['postgres:db']
  volumes_from 'data-volume'
  action :run
  port '3000:3000'
  command '/config/rails-example/run.sh'
end
