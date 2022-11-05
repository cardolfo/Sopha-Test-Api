require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/rails'
require 'capistrano/puma'
install_plugin Capistrano::Puma
require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git
install_plugin Capistrano::Puma::Nginx
require 'capistrano/rvm'
require 'capistrano/bundler'
require 'capistrano/rails/migrations'
require 'capistrano/figaro_yml'
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
