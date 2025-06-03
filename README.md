cd /home/www/shells/;
sudo rm -Rf log/*.log;
sudo git pull;
sudo su;
tmux ls;
pkill tmux;
tmux new-session -d -s d1-01 'cd /home/www/shells/command; sh d1-01.sh >> /home/www/shells/log/d1-01.log; sleep 2';
tmux new-session -d -s d1-02 'cd /home/www/shells/command; sh d1-02.sh >> /home/www/shells/log/d1-02.log; sleep 2';
tmux new-session -d -s d1-03 'cd /home/www/shells/command; sh d1-03.sh >> /home/www/shells/log/d1-03.log; sleep 2';
tmux new-session -d -s d1-04 'cd /home/www/shells/command; sh d1-04.sh >> /home/www/shells/log/d1-04.log; sleep 2';
tmux new-session -d -s d1-05 'cd /home/www/shells/command; sh d1-05.sh >> /home/www/shells/log/d1-05.log; sleep 2';
tmux new-session -d -s d1-06 'cd /home/www/shells/command; sh d1-06.sh >> /home/www/shells/log/d1-06.log; sleep 2';
tmux new-session -d -s d1-07 'cd /home/www/shells/command; sh d1-07.sh >> /home/www/shells/log/d1-07.log; sleep 2';
tmux new-session -d -s d1-08 'cd /home/www/shells/command; sh d1-08.sh >> /home/www/shells/log/d1-08.log; sleep 2';
tmux new-session -d -s d1-09 'cd /home/www/shells/command; sh d1-09.sh >> /home/www/shells/log/d1-09.log; sleep 2';
tmux new-session -d -s d1-10 'cd /home/www/shells/command; sh d1-10.sh >> /home/www/shells/log/d1-10.log; sleep 2';
tmux new-session -d -s d1-11 'cd /home/www/shells/command; sh d1-11.sh >> /home/www/shells/log/d1-11.log; sleep 2';
tmux new-session -d -s d1-12 'cd /home/www/shells/command; sh d1-12.sh >> /home/www/shells/log/d1-12.log; sleep 2';
tmux new-session -d -s d1-13 'cd /home/www/shells/command; sh d1-13.sh >> /home/www/shells/log/d1-13.log; sleep 2';
tmux new-session -d -s d1-14 'cd /home/www/shells/command; sh d1-14.sh >> /home/www/shells/log/d1-14.log; sleep 2';
tmux new-session -d -s d1-15 'cd /home/www/shells/command; sh d1-15.sh >> /home/www/shells/log/d1-15.log; sleep 2';
tmux new-session -d -s d1-16 'cd /home/www/shells/command; sh d1-16.sh >> /home/www/shells/log/d1-16.log; sleep 2';
tmux ls;





cd /home/www/shells/;
sudo rm -Rf log/*.log;
sudo git pull;
sudo su;
tmux ls;
pkill tmux;
tmux new-session -d -s d2-01 'cd /home/www/shells/command; sh d2-01.sh >> /home/www/shells/log/d2-01.log; sleep 2';
tmux new-session -d -s d2-02 'cd /home/www/shells/command; sh d2-02.sh >> /home/www/shells/log/d2-02.log; sleep 2';
tmux new-session -d -s d2-03 'cd /home/www/shells/command; sh d2-03.sh >> /home/www/shells/log/d2-03.log; sleep 2';
tmux new-session -d -s d2-04 'cd /home/www/shells/command; sh d2-04.sh >> /home/www/shells/log/d2-04.log; sleep 2';
tmux new-session -d -s d2-05 'cd /home/www/shells/command; sh d2-05.sh >> /home/www/shells/log/d2-05.log; sleep 2';
tmux new-session -d -s d2-06 'cd /home/www/shells/command; sh d2-06.sh >> /home/www/shells/log/d2-06.log; sleep 2';
tmux new-session -d -s d2-07 'cd /home/www/shells/command; sh d2-07.sh >> /home/www/shells/log/d2-07.log; sleep 2';
tmux new-session -d -s d2-08 'cd /home/www/shells/command; sh d2-08.sh >> /home/www/shells/log/d2-08.log; sleep 2';
tmux new-session -d -s d2-09 'cd /home/www/shells/command; sh d2-09.sh >> /home/www/shells/log/d2-09.log; sleep 2';
tmux new-session -d -s d2-10 'cd /home/www/shells/command; sh d2-10.sh >> /home/www/shells/log/d2-10.log; sleep 2';
tmux new-session -d -s d2-11 'cd /home/www/shells/command; sh d2-11.sh >> /home/www/shells/log/d2-11.log; sleep 2';
tmux new-session -d -s d2-12 'cd /home/www/shells/command; sh d2-12.sh >> /home/www/shells/log/d2-12.log; sleep 2';
tmux new-session -d -s d2-13 'cd /home/www/shells/command; sh d2-13.sh >> /home/www/shells/log/d2-13.log; sleep 2';
tmux new-session -d -s d2-14 'cd /home/www/shells/command; sh d2-14.sh >> /home/www/shells/log/d2-14.log; sleep 2';
tmux new-session -d -s d2-15 'cd /home/www/shells/command; sh d2-15.sh >> /home/www/shells/log/d2-15.log; sleep 2';
tmux new-session -d -s d2-16 'cd /home/www/shells/command; sh d2-16.sh >> /home/www/shells/log/d2-16.log; sleep 2';
tmux ls;


















split -n l/48 04-0605.sh part_;

i=41
for f in part_*; do
  mv "$f" $(printf "d%02d.sh" $i)
  i=$((i + 1))
done