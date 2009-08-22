Factory.define :user do |u|
  u.name "Ricardo"
  u.login "ricardoalmeida"
  u.email "ricardo@almeida.com.br"
  u.password "teste124"
  u.password_confirmation "teste124"
end

Factory.define :project do |p|
  p.name "Project1"
end
