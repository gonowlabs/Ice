namespace :db do
  desc "Populate database"
  task :populate => :environment do
    Contract.destroy_all
    contract1 = Contract.create! :name => "Contract1"
    contract2 = Contract.create! :name => "Contract2"

    project11 = contract1.projects.create! :name => "Project1 1"
    project12 = contract1.projects.create! :name => "Project1 2"
    project21 = contract1.projects.create! :name => "Project2 1"
    project22 = contract1.projects.create! :name => "Project2 2"

    User.destroy_all
    user_a = User.create! :name => "Diego Carrion"
    user_b = User.create! :name => "Rafael Rosa"
    user_c = User.create! :name => "Ricardo Almeida"

    project11.users << user_a
    project12.users << user_b
    project21.users << user_a
    project22.users << user_c
    project22.users << user_a
  end
end
