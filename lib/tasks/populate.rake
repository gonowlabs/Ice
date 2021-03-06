def random_hour
  rand(10) + 1
end

namespace :db do
  desc "Populate database"
  task :populate => :environment do
    Contract.destroy_all
    Project.destroy_all
    
    contract1 = Contract.create! :name => "Contract1"
    contract2 = Contract.create! :name => "Contract2"

    User.destroy_all
    user1 = User.create! :name => "Diego Carrion"  , :email => 'dcrec1@gonow.com.br'     , :login => 'dcrec1', :password => 'teste123', :password_confirmation => 'teste123'
    user2 = User.create! :name => "Rafael Rosa"    , :email => 'rafaelrosafu@gmail.com'  , :login => 'rafaelrosafu', :password => 'teste123', :password_confirmation => 'teste123'
    user3 = User.create! :name => "Ricardo Almeida", :email => 'ricardoalmeida@gmail.com', :login => 'ricardoalmeida', :password => 'teste123', :password_confirmation => 'teste123'
    user4 = User.create! :name => "Gonow Labs", :email => 'labs@gonow.com.br' , :login => 'labs', :password => 'gandra', :password_confirmation => 'gandra', :role => User::ADMIN
    user5 = User.create! :name => "Alexandre Gandra", :email => 'gandra@gmail.com' , :login => 'gandra', :password => 'gandra', :password_confirmation => 'gandra', :role => User::MANAGER
    
    project1 = contract1.projects.create! :name => "Project 1", :manager => user5
    project2 = contract1.projects.create! :name => "Project 2", :manager => user5
    project3 = contract1.projects.create! :name => "Project 3", :manager => user5
    project4 = contract1.projects.create! :name => "Project 4", :manager => user5

    project1.users << user1
    project2.users << user2
    project3.users << user1
    project4.users << user3
    project4.users << user1
    
    Entry.destroy_all
    (Date.today - 10).upto(Date.today) do |date|
      (1..3).each do |i|
        h = random_hour
        puts h
        Entry.create! :project => eval("project#{rand(4) + 1}"),
                      :hours => h,
                      :user => eval("user#{i}"),
                      :date => date
      end
    end
  end
end
