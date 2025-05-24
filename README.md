sudo su;
pkill tmux;
tmux new-session -d -s t01 'cd /home/www/shells/command; sh t01.sh >> /home/www/shells/log/t01.log; sleep 2';
tmux new-session -d -s t02 'cd /home/www/shells/command; sh t02.sh >> /home/www/shells/log/t02.log; sleep 2';
tmux new-session -d -s t03 'cd /home/www/shells/command; sh t03.sh >> /home/www/shells/log/t03.log; sleep 2';
tmux new-session -d -s t04 'cd /home/www/shells/command; sh t04.sh >> /home/www/shells/log/t04.log; sleep 2';
tmux new-session -d -s t05 'cd /home/www/shells/command; sh t05.sh >> /home/www/shells/log/t05.log; sleep 2';
tmux new-session -d -s t06 'cd /home/www/shells/command; sh t06.sh >> /home/www/shells/log/t06.log; sleep 2';
tmux new-session -d -s t07 'cd /home/www/shells/command; sh t07.sh >> /home/www/shells/log/t07.log; sleep 2';
tmux new-session -d -s t08 'cd /home/www/shells/command; sh t08.sh >> /home/www/shells/log/t08.log; sleep 2';
tmux new-session -d -s t09 'cd /home/www/shells/command; sh t09.sh >> /home/www/shells/log/t09.log; sleep 2';
tmux new-session -d -s t10 'cd /home/www/shells/command; sh t10.sh >> /home/www/shells/log/t10.log; sleep 2';






sudo su;
pkill tmux;
tmux new-session -d -s t11 'cd /home/www/shells/command; sh t11.sh >> /home/www/shells/log/t11.log; sleep 2';
tmux new-session -d -s t12 'cd /home/www/shells/command; sh t12.sh >> /home/www/shells/log/t12.log; sleep 2';
tmux new-session -d -s t13 'cd /home/www/shells/command; sh t13.sh >> /home/www/shells/log/t13.log; sleep 2';
tmux new-session -d -s t14 'cd /home/www/shells/command; sh t14.sh >> /home/www/shells/log/t14.log; sleep 2';
tmux new-session -d -s t15 'cd /home/www/shells/command; sh t15.sh >> /home/www/shells/log/t15.log; sleep 2';
tmux new-session -d -s t16 'cd /home/www/shells/command; sh t16.sh >> /home/www/shells/log/t16.log; sleep 2';
tmux new-session -d -s t17 'cd /home/www/shells/command; sh t17.sh >> /home/www/shells/log/t17.log; sleep 2';
tmux new-session -d -s t18 'cd /home/www/shells/command; sh t18.sh >> /home/www/shells/log/t18.log; sleep 2';
tmux new-session -d -s t19 'cd /home/www/shells/command; sh t19.sh >> /home/www/shells/log/t19.log; sleep 2';
tmux new-session -d -s t20 'cd /home/www/shells/command; sh t20.sh >> /home/www/shells/log/t20.log; sleep 2';








sudo su;
pkill tmux;
tmux new-session -d -s t21 'cd /home/www/shells/command; sh t21.sh >> /home/www/shells/log/t21.log; sleep 2';
tmux new-session -d -s t22 'cd /home/www/shells/command; sh t22.sh >> /home/www/shells/log/t22.log; sleep 2';
tmux new-session -d -s t23 'cd /home/www/shells/command; sh t23.sh >> /home/www/shells/log/t23.log; sleep 2';
tmux new-session -d -s t24 'cd /home/www/shells/command; sh t24.sh >> /home/www/shells/log/t24.log; sleep 2';
tmux new-session -d -s t25 'cd /home/www/shells/command; sh t25.sh >> /home/www/shells/log/t25.log; sleep 2';
tmux new-session -d -s t26 'cd /home/www/shells/command; sh t26.sh >> /home/www/shells/log/t26.log; sleep 2';
tmux new-session -d -s t27 'cd /home/www/shells/command; sh t27.sh >> /home/www/shells/log/t27.log; sleep 2';
tmux new-session -d -s t28 'cd /home/www/shells/command; sh t28.sh >> /home/www/shells/log/t28.log; sleep 2';
tmux new-session -d -s t29 'cd /home/www/shells/command; sh t29.sh >> /home/www/shells/log/t29.log; sleep 2';
tmux new-session -d -s t30 'cd /home/www/shells/command; sh t30.sh >> /home/www/shells/log/t30.log; sleep 2';





split -n l/30 00.sh part_;

i=1
for f in part_*; do
  mv "$f" $(printf "t%02d.sh" $i)
  i=$((i + 1))
done