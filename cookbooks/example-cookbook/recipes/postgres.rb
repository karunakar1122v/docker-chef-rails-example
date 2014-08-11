#
# Cookbook Name:: example-cookbook
# Recipe:: postgres-run
#


include_recipe 'docker'

remote_directory '/tmp/postgres' do
  source 'postgres'
end

docker_image 'austenito/ruby' do
  source '/tmp/postgres'
  action :build_if_missing
end

if `sudo docker ps -a | grep postgres`.size > 0
  execute('stop container') { command "docker stop -t 60 postgres" }
  execute('remove container') { command "docker rm -f postgres" }
end

docker_container 'postgres' do
  image 'austenito/ruby'
  container_name 'postgres'
  port "5432:5432"
  detach true
  env ["POSTGRES_USER=#{node['postgresql']['user']}",
       "POSTGRES_PASSWORD=#{node['postgresql']['password']}"
      ]
  volumes_from 'data-volume'
  action :run
  command '/tmp/postgres/run.sh'
end
