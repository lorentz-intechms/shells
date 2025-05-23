sudo su;
tmux new-session -d -s t01 'cd /home/www/shells/command; sh t01.sh >> /home/www/shells/log/t01.log; sleep 2';