require 'bundler/capistrano'
set :application, "meter_map.ie"

# Deploy from your local Git repo by cloning and uploading a tarball
default_run_options[:pty] = true  # Must be set for the password prompt from git to work
set :repository, "git@github.com:vanpelt/rails-app.git"  # Your clone URL
set :scm, "git"
set :user, "deployer"  # The server's user for deploys
set :scm_passphrase, "p@ssw0rd"  # The deploy user's password

set :user, :deploy
set :deploy_to, "/srv/www/#{application}"
set :use_sudo, false

role :web, "178.79.137.160"                          # Your HTTP server, Apache/etc
role :app, "178.79.137.160"                          # This may be the same as your `Web` server
role :db,  "178.79.137.160", :primary => true # This is where Rails migrations will run


set :branch, "master"
set :deploy_via, :remote_cache

# Uncomment if you are using Rails' asset pipeline
load 'deploy/assets'

before "deploy", "deploy:check_revision"

namespace :deploy do
  desc "Make sure there is something to deploy"
  task :check_revision, :roles => [:web] do
    unless `git rev-parse HEAD` == `git rev-parse origin/#{branch}`
      puts ""
      puts "  \033[1;33m**************************************************\033[0m"
      puts "  \033[1;33m* WARNING: HEAD is not the same as origin/#{branch} *\033[0m"
      puts "  \033[1;33m**************************************************\033[0m"
      puts ""
      exit
    end
  end
  
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  after "deploy:update", "deploy:cleanup"
end