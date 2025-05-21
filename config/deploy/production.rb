set :stage, :production
set :rails_env, :production
set :domain, "130.193.41.59"

role :web, fetch(:domain)
role :app, fetch(:domain)
role :db,  fetch(:domain), primary: true

set :branch, "main"
set :deploy_to, "/home/ivan_yakunin/shop"
set :tmp_dir, "/home/ivan_yakunin/tmp"
set :keep_releases, 5

set :puma_systemctl_user, :system
set :puma_service_unit_name, "puma_production.service"

set :bundle_flags, "--no-cache"

set :ssh_options, forward_agent: true, user: "ivan_yakunin"

# Defaults to false. If true, it's skip migration if files in db/migrate not modified
set :conditionally_migrate, true

set :rvm_type, :user
set :rvm_ruby_version, RUBY_VERSION

append :linked_files, "config/credentials/production.key"

# namespace :deploy do
#   task restart: "monit:restart"
# end

after "deploy:publishing", "deploy:restart"
