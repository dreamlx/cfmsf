require 'rvm/capistrano' # 支持rvm
require 'bundler/capistrano'  # 支持自动bundler
set :rvm_autolibs_flag, "read-only"        # more info: rvm help autolibs

set :application, "bancheng" #应用的名字
set :keep_releases, 10 
set :location, "115.29.189.213" #部署的ip地址
# set :location, "http://tangdigital.com/"
role :web, location                       # Your HTTP server, Apache/etc
role :app, location                       # This may be the same as your `Web` server
role :db,  location, :primary => true # This is where Rails migrations will run
#role :db,  "3dtzk.com"

#server details
default_run_options[:pty] = true  # Must be set for the password prompt
set :deploy_to, "/home/railsadmin/ROR/bancheng.com"  #部署在服务器上的地址

set :user, "railsadmin" #ssh连接服务器的帐号
set :use_sudo, false
set :ssh_options, { :forward_agent => true }
#repo details
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :scm_username, ENV["GITHUB_USERNAME"] #github帐号
set :scm_passphrase, ENV["GITHUB_PASSWORD"] #设置github  ssh时设置到密码
set :repository,  "git@github.com:HuberyDu/bancheng.git" #项目在github上的帐号
set :branch, "master" #github上具体的分支
set :deploy_via, :remote_cache

#tasks
namespace :deploy do
desc "SCP transfer figaro configuration to the shared folder"
  task :setup do
    transfer :up, "config/application.yml", "#{shared_path}/config/application.yml", :via => :scp
    transfer :up, "config/database.yml.server", "#{shared_path}/config/database.yml", :via => :scp
end

task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
end

task :stop, :roles => :app do
    #do nonthing
end

desc "Symlink shared resources on each release - not used"
task :symlink_shared, :roles => :app do
  run "touch #{release_path}/config/application.yml"
  run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  run "ln -nfs #{shared_path}/config/application.yml #{release_path}/config/application.yml"
end

task :precompile, :roles => :web do  
    run "cd #{current_path} && #{rake} RAILS_ENV=production assets:precompile"  
end  

end

after "deploy:update", "deploy:migrate"
after "deploy:migrate", "deploy:symlink_shared" 
after "deploy:migrate", "deploy:precompile"