namespace :setup do

  desc 'Upload database.yml file.'
  task :upload_yml do
    on roles(:app) do
      execute "mkdir -p #{shared_path}/config"
      upload! StringIO.new(File.read('config/database.yml')), "#{shared_path}/config/database.yml"
    end
  end

  desc 'Symlinks config files for Nginx and Unicorn.'
  task :symlink_config do
    on roles(:app) do
      execute "ln -nfs #{current_path}/config/nginx_demo_deploy.conf /etc/nginx/sites-enabled/#{fetch(:application)}"
      execute "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{fetch(:application)}"

      execute 'rm -f /etc/nginx/sites-enabled/default'
   end
  end

end
