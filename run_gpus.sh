#! /bin/bash 

# sudo apt update 
# sudo apt install byobu -y 

# conda env create -f robodiff_env.yaml

# conda activate robodiff

# byobu kill-session -t infdiff_single 2>/dev/null || true
# pkill -f "python" 2>/dev/null || true
# sleep 2

byobu new-session -d -s id
byobu select-pane -t 0
byobu split-window -v # row 2
byobu select-pane -t 0
byobu split-window -v  # row 3
byobu select-pane -t 0
byobu split-window -v  # row 4

# now split verticals
byobu select-pane -t 0 
byobu split-window -h  # 1, 1
byobu select-pane -t 2 
byobu split-window -h  # 2, 2

# now third row
byobu select-pane -t 4
byobu split-window -h # 3, 3

# now fourth row
byobu select-pane -t 6
byobu split-window -h # 4, 4

byobu send-keys -t 0 'conda activate robodiff' 'C-m'
sleep 1.
byobu send-keys -t 0 'python scripts/id_pusht.py --loss mse --device cuda:0' 'C-m'  # loss as though we were doing fd
sleep 2.

# loss = \alpha l_cm + (1 - \alpha) mse_loss
byobu send-keys -t 1 'conda activate robodiff' 'C-m'
sleep 1.
byobu send-keys -t 1 'python scripts/id_pusht.py --loss mixed_cm --cm-loss-weight 0.15 --device cuda:1' 'C-m'  # mixture of cm and mse with weigh alpha = 0.15
sleep 2.

byobu send-keys -t 2 'conda activate robodiff' 'C-m'
sleep 1.
byobu send-keys -t 2 'python scripts/id_pusht.py --loss mixed_cm --cm-loss-weight 0.25 --device cuda:2' 'C-m' # \alpha=1/4
sleep 2.

byobu send-keys -t 3 'conda activate robodiff' 'C-m'
sleep 1.
byobu send-keys -t 3 'python scripts/id_pusht.py --loss mixed_cm --cm-loss-weight 0.5 --device cuda:3' 'C-m' # \alpha=1/2
sleep 2.

byobu send-keys -t 4 'conda activate robodiff' 'C-m'
sleep 1.
byobu send-keys -t 4 'python scripts/id_pusht.py --loss mixed_cm --cm-loss-weight 0.75 --device cuda:4' 'C-m' # \alpha=3/4
sleep 2.

byobu send-keys -t 5 'conda activate robodiff' 'C-m'
sleep 1.
byobu send-keys -t 5 'python scripts/id_pusht.py --loss mixed_cm --cm-loss-weight 0.85 --device cuda:5' 'C-m' # \alpha=.85
sleep 2.

# byobu new-window
byobu send-keys -t 6 'conda activate robodiff' 'C-m'
sleep 1.
byobu send-keys -t 6 'python scripts/id_pusht.py --loss precision_weighted --cm-loss-weight 1 --device cuda:6' 'C-m' # Cameron-Martin Loss (Plain) -- see eq. 32 in paper
sleep 2.

byobu send-keys -t 7 'conda activate robodiff' 'C-m'
sleep 1.
byobu send-keys -t 7 'python  scripts/fd_pusht.py --device cuda:7' 'C-m'
sleep 2.

byobu attach -t id