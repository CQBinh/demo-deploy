lock '3.4.0'

set :application, 'demo_deploy'
set :repo_url, 'git@github.com:CQBinh/demo-deploy.git'
set :branch, :master
set :deploy_to, "/var/www/#{fetch(:application)}"

set :pty, true
set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
set :keep_releases, 5
set :rvm_type, :user
set :rvm_ruby_version, 'ruby-2.2.3'
set :nginx_config_path, '/etc/nginx/conf.d'
set :unicorn_env, fetch(:rack_env, fetch(:rails_env, 'production'))
