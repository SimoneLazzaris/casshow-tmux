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

# PAGER="less"
# pager    "Pager: $PAGER" \

while [ 1 == 1 ]
do
exec 3>&1

R=$(dialog  --no-cancel --no-tags --no-ok \
 --title "CAS by CodeNotary" --menu "community attestation demo" 20 50 20 \
 login    "Login to CAS" \
 notarize "Notarize asset" \
 authene  "Authenticate asset" \
 inspect  "Inspect  asset" \
 untrust  "Untrust asset" \
 trust    "Unsupport asset" \
 "" "" \
 quit     "Exit program" \
 2>&1 1>&3)

exec 3>&-

case $R in
"login")
  tmux selectp -t 2 \; send-keys C-m C-m "./cas login" C-m 
  ;;
"notarize")
  tmux selectp -t 2 \; send-keys C-m C-m "./cas notarize $ASSET" C-m 
  ;;
"authene")
  tmux selectp -t 2 \; send-keys C-m C-m "./cas authenticate $ASSET" C-m 
  ;;
"inspect")
  tmux selectp -t 2 \; send-keys C-m C-m "./cas inspect $ASSET" C-m 
  ;;
"untrust")
  tmux selectp -t 2 \; send-keys C-m C-m "./cas untrust $ASSET" C-m 
  ;;
"trust")
  tmux selectp -t 2 \; send-keys C-m C-m "./cas unsupport $ASSET" C-m 
  ;;
"quit")
  tmux selectp -t 2 \; send-keys C-c   
  tmux selectp -t 1 \; send-keys C-c   
  tmux selectp -t 2 \; send-keys C-d  
  tmux selectp -t 1 \; send-keys C-d  
  tmux selectp -t 0 \; send-keys C-d  
  tmux detach
  tmux kill-session -t casshow
  break
  ;;
esac
tmux selectp -t 0
done
clear

