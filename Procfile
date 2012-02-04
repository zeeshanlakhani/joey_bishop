web: rerun -p "**/*.{rb,js,css,scss,sass,erb,html,haml,ru,coffee,slim,less}" -- bundle exec rackup --port 8888 config.ru
worker: env PIDFILE=./tmp/pids/resque.pid env BACKGROUND=yes env VVERBOSE=false bundle exec rake resque:work QUEUE=*

#worker: env PIDFILE=./tmp/pids/resque.pid env BACKGROUND=yes env VVERBOSE=false bundle exec rake resque:workers COUNT=5 QUEUE=* => 5 threads on dev
