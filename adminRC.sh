#!/bin/bash
#################################################################
# This will provide some aliases to simplify gracefull shutdown #
# useful as a .alias file in the home dir of the user on admin  #
# host.								#
# Creates cordon, uncordon, stopworkers, stopmasters 		#
#################################################################

alias cordon='kubectl get nodes -o name | xargs -I{} kubectl cordon {}'

alias stopworkers='docker exec -it $(docker ps -q -f name=salt-master) \
salt --async -G 'roles:kube-minion' cmd.run 'systemctl poweroff''

alias stopmasters='[200~docker exec -it $(docker ps -q -f name=salt-master) \
	salt --async -G 'roles:kube-master' cmd.run 'systemctl poweroff''

alias undordon=kubectl get nodes -o name | xargs -I{} kubectl uncordon {}'

