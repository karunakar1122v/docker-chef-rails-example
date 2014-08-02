#
# Cookbook Name:: chef-docker-rails-example
# Recipe::nginx-run
#

include_recipe 'docker'

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
