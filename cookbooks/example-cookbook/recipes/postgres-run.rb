#
# Cookbook Name:: example-cookbook
# Recipe:: postgres-run
#


include_recipe 'docker'

if `sudo docker ps -a | grep postgres`.size > 0
  execute('stop container') { command "docker stop -t 60 postgres" }
  execute('remove container') { command "docker rm -f postgres" }
end

docker_container 'postgres' do
  image 'ubuntu:postgres'
  container_name 'postgres'
  port "5432:5432"
  detach true
  env ["POSTGRES_USER=#{node['postgres']['user']}",
       "POSTGRES_PASSWORD=#{node['postgres']['password']}"
      ]
  volumes_from 'data-volume'
  action :run
  command '/config/postgres/run.sh'
end
