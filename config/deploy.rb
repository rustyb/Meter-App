set :application, "meter_map"
set :repository,  "git@github.com:rustyb/Meter-App.git"
ssh_options[:forward_agent] = true

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :scm_verbose, true

set :domain, "109.74.199.253"  # your domain.com for this app
set :user, "colin" # your username on slicehost
set :admin_runner, "colin"
set :use_sudo, false

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run
role :db,  domain


set :scm_passphrase, "100.fly_63" #github password
set :branch, "master" #this is the branch you want. most likely master
set :deploy_via, :remote_cache
set :copy_exclude, %w(.git doc test)

set :port, 30000  # your port on slicehost. Standard port for ssh is 22, but if you followed the slicehost articles, you probably changed this to something different
set :deploy_to, "/home/#{user}/public_html/#{application}"          # Where on the server your app will be deployed
set :chmod755, "app config db lib public vendor script script/* public/disp*"          # Some files that will need proper permissions
set :chmod666, "log/production.log"
#set :git_enable_submodules, true # Make sure submodules are checked out

#set :asset_directories, ['public/uploads/*']

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
set :keep_releases, 5
before "deploy", "deploy:check_revision"

require "bundler/capistrano"

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
     
        
     after "deploy:update", "deploy:cleanup", 
end
 
 
        require './config/boot'
        

