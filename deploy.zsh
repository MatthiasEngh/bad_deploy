#!/bin/zsh
source "${argv[0]}/ssh-config.conf"
source "${argv[1]}/scp.conf"
scp -i ${ssh-identity-file} ${scp-source-dir} ${ssh-user}@${ssh-host}:${scp-target-path}
