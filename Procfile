web: rerun -p "**/*.{rb,js,css,scss,sass,erb,html,haml,ru,coffee,slim}" -- bundle exec rackup --port 8888 config.ru
worker: env PIDFILE=./resque.pid env BACKGROUND=yes env VVERBOSE=false env QUEUE=default bundle exec rake resque:work
