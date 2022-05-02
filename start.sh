#!/bin/bash

# Copyright 2022 CodeNotary, Inc. All rights reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 	http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

source env.sh
rm -rf data

session="casshow"
tmux has-session -t $session 2>/dev/null

if [ $? == 0 ]; then
  tmux kill-session $session
fi
tmux new-session -d -s $session

tmux selectp -t 0
tmux splitw -h -p 70
tmux selectp -t 0
tmux splitw -v -p 50
#tmux selectp -t 0 \; send-keys 'echo 0' C-m
#tmux selectp -t 1 \; send-keys 'echo 1' C-m
#tmux selectp -t 2 \; send-keys 'echo 2' C-m

# Pane layout:
# 0 2
# 1 2

tmux selectp -t 0
tmux send-keys './menu.sh' C-m
tmux selectp -t 1 \; send-keys './filelist.sh' C-m
#tmux selectp -t 3 \; send-keys './watch.sh' C-m
tmux selectp -t 0
tmux attach-session -t $session
