source $HOME/.rvm/environments/default
path enter "${stage_path}"
gem install bundler
bundle install
bundle upgrade
bundle exec nanoc compile
