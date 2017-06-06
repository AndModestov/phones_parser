# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'data_parser'
set :repo_url, 'git@bitbucket.org:a_modestov/data_parser.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/deployer/data_parser'
set :deploy_user, 'deployer'


# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, [])
                     .push('.env')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, [])
                    .push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'unicorn:restart'
    end
  end

  after :publishing, :restart
end
