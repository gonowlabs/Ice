# This file is copied to ~/spec when you run 'ruby script/generate rspec'
# from the project root directory.
ENV["RAILS_ENV"] ||= 'test'
require File.dirname(__FILE__) + "/../config/environment" unless defined?(RAILS_ROOT)
require 'spec/autorun'
require 'spec/rails'

require 'ruby-debug'

require File.dirname(__FILE__) + "/resource_helper.rb"

Spec::Runner.configure do |config|
  # If you're not using ActiveRecord you should remove these
  # lines, delete config/database.yml and disable :active_record
  # in your config/boot.rb
  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false
  config.fixture_path = RAILS_ROOT + '/spec/fixtures/'
end

def login
  controller.stub!(:current_user).and_return(User.new)
end

def login_admin
  controller.stub!(:current_user).and_return(User.new(:role => User::ADMIN))
end

def login_manager
  controller.stub!(:current_user).and_return(@user = User.new(:role => User::MANAGER))
end

def build_contracts
  5.times.map {build_contract}
end

def build_contract
  Contract.new :projects => build_projects
end

def build_projects
  3.times.map {Project.new}
end

def build_entries
  5.times.map {Entry.new(:hours => rand(10))}
end

def build_users
  4.times.map {User.new}
end