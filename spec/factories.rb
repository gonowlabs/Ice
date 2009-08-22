Factory.define :contract do |c|
  c.name "Contract1"
end

Factory.define :project_1, :class => Project do |p|
  p.name "Project 1"
  p.association :contract, :factory => :contract
end
Factory.define :project_2, :class => Project do |p|
  p.name "Project 2"
  p.association :contract, :factory => :contract
end

Factory.define :user_a, :class => User do |u|
  u.name "Ricardo"
  u.login "ricardoalmeida"
  u.email "ricardo@almeida.com.br"
  u.password "teste124"
  u.password_confirmation "teste124"
end

Factory.define :user_b, :class => User do |u|
  u.name "Diego"
  u.login "diego"
  u.email "diego@gonow.com.br"
  u.password "teste124"
  u.password_confirmation "teste124"
end

Factory.define :entry_1, :class => Entry do |e|
  e.date Date.today
  e.hours rand(12)
end