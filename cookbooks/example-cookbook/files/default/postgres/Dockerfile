FROM austenito:ruby

RUN apt-get update

RUN cd /tmp && /opt/chef/embedded/bin/berks install --path /tmp/cookbooks
RUN chef-solo -c /tmp/solo.rb -j /tmp/solo.json

EXPOSE 5432
