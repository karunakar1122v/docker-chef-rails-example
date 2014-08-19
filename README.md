# Docker, Chef, and Rails!

An example infrastructure setup using Docker, Chef and Rails. The setup includes:

* Ruby 2.1.2
* Postgres
* Rails 4
* Unicorn
* Nginx

I followed [Creating immutable servers with chef and docker](http://tech.paulcz.net/2013/09/creating-immutable-servers-with-chef-and-docker-dot-io.html) for examples on running Chef to create my Docker Images.


# Getting started with Vagrant

```
git clone https://github.com/austenito/docker-chef-rails-example
bundle
berks
vagrant plugin install vagrant-omnibus
vagrant up
```

# Resources

* [Getting Started with Docker](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-getting-started)
* [Vagrant](http://www.vagrantup.com/)
* [Chef-Docker](https://github.com/bflad/chef-docker) - The chef cookbook used to manage docker.



