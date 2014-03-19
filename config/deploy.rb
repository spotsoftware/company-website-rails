# config valid only for Capistrano 3.1
lock '3.1.0'

set :layouts, 'company_website'

set :deploy_to, '/var/www/my_app'

# Number of releases to keep
set :keep_releases, 4

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# { SCM

set :repo_url, 'git@github.com:spotsoftware/company-website-rails'
set :scm, :git
set :branch, fetch(:branch, 'master')
ssh_options[:forward_agent] = true

# }

# { Logging

set :format, :pretty
set :log_level, :info
set :pty, true

# }

# { RBEnv

set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, File.read(File.join(File.dirname(__FILE__), '.ruby-version'))
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

# }

# { Unicorn

app_path = File.dirname(__FILE__)

# Set unicorn options
worker_processes 4
preload_app true
timeout 180
listen '127.0.0.1:9000'

# Spawn unicorn master worker for user apps (group: apps)
user 'apps', 'apps'

# Fill path to your app
working_directory app_path

# Should be 'production' by default, otherwise use other env
rails_env = ENV['RAILS_ENV'] || 'production'

# Log everything to one file
stderr_path 'log/unicorn.log'
stdout_path 'log/unicorn.log'

# Set master PID location
pid "#{app_path}/tmp/pids/unicorn.pid"

# }

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'unicorn:restart'
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end

after 'deploy:publishing', 'deploy:restart'
