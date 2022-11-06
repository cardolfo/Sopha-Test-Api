require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/rvm'
require 'capistrano/bundler'
require 'capistrano/puma'
require 'capistrano/scm/git'
require 'capistrano/rails/migrations'
require 'capistrano/figaro_yml'
install_plugin Capistrano::SCM::Git
install_plugin Capistrano::Puma::Nginx
install_plugin Capistrano::Puma
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
