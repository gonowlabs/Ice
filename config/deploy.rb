set :application, "ice"
set :repository,  "git://github.com/gonow/Ice.git"
set :deploy_to, "/opt/#{application}"
set :scm, :git

require 'capistrano/ext/multistage'

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Create asset packages for production"
  task :after_update_code, :roles => [:web] do
    run "cd #{release_path} && rake asset:packager:build_all"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end
