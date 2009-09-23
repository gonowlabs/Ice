set :user, 'gonow'
set :domain, "hooters.gonow.intranet"

role :app, domain
role :web, domain
role :db,  domain, :primary => true
