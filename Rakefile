# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'

desc "Inits the database"
task :init => :environment do
  email = 'labs@gonow.com.br'
  if User.find_by_email(email).nil? 
    pass = 'gandra'
    user = User.create! :email => email, :login => 'labs', :password => pass, 
                        :password_confirmation => pass, :role => User::ADMIN
  end
end