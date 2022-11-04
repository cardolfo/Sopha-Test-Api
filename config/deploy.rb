set :application, 'sopha-test-api'
set :repo_url, 'git@github.com:cardolfo/Sopha-Test-Api.git'
set :branch, ENV['BRANCH'] if ENV['BRANCH']
set :linked_dirs,
    fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system',
                                 'public/uploads')
set :rvm_ruby_version, '2.7.1'
set :passenger_restart_with_touch, true
