user = 'ubuntu'
ip_address = '52.27.15.21'

role :app, ["#{user}@#{ip_address}"]
role :web, ["#{user}@#{ip_address}"]
role :db,  ["#{user}@#{ip_address}"]

server ip_address,
       user: user,
       roles: %w{web app}

set :rails_env, 'production'

set :bundle_flags, '--no-deployment'

set :ssh_options, {
  keys: %w(~/.ssh/id_rsa_cqbinh.pub),
  forward_agent: true,
  port: 22
}

 set :nginx_server_name, 'demo_deploy.appconus.com'
