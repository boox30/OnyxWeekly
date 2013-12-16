# FreeBSD
namespace :env do
  task :production => [:environment] do
    set :domain,              '192.168.0.17'
    set :deploy_to,           '/home/dxw/apps/onyxweekly'
    set :sudoer,              'dxw'
    set :user,                'dxw'
    set :group,               'dxw'
    set :rvm_path,            '$HOME/.rvm/scripts/rvm'   # we don't use that. see below.
    set :services_path,       '/etc/init.d'                  # where your God and Unicorn service control scripts will go
    set :nginx_path,          '/etc/nginx'
    set :deploy_server,       'onyxweekly'                    # just a handy name of the server
    set :unicorn_workers,     2
    invoke :defaults                                         # load rest of the config
    invoke :"rvm:use[ruby-2.0.0-p247@default]"                       # since my prod server runs 1.9 as default system ruby, there's no need to run rvm:use
  end
end
