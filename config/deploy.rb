lock '3.4.0'

set :application, 'demo_deploy'
set :repo_url, 'git@github.com:CQBinh/demo-deploy.git'
set :branch, :master
set :deploy_to, "/var/www/#{fetch(:application)}"

set :pty, true
set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
set :deploy_via, :remote_cache
set :keep_releases, 5

# rbenv config
set :rbenv_type, :user
set :rbenv_ruby, '2.3.0'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all

set :nginx_config_path, '/etc/nginx/conf.d'
set :unicorn_env, fetch(:rack_env, fetch(:rails_env, 'production'))
