ln -nfs $HOME/shared/public/presentations $HOME/current/public/presentations
releases_path="$HOME/shared/public/releases/"
mkdir -p $releases_path
ln -nfs $releases_path/rvm-update-head $releases_path/rvm-update-head 2>/dev/null
ln -nfs $releases_path/rvm-update-latest $releases_path/rvm-update-latest 2>/dev/null
