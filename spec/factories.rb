Factory.define :contract do |c|
  c.name "Contract1"
end

Factory.define :user do |u|
  u.name "Ricardo"
  u.login "ricardoalmeida"
  u.email "ricardo@almeida.com.br"
  u.password "teste124"
  u.password_confirmation "teste124"
end

Factory.define :project do |p|
  p.name "Project1"
  p.association :contract, :factory => :contract
end

Factory.define :entry do |e|
  e.date Date.today
  e.hours 8
  e.association :user, :factory => :user
  e.association :project, :factory => :project
end
