#!/bin/zsh
set -eu

instance_dir=${argv[1]}
instance_ssh_config="${instance_dir}/ssh-config.conf"
echo "prepared to read ssh config: ${instance_ssh_config}"
source $instance_ssh_config

run () {
    ssh -i ${ssh_identity_file} ${ssh_user}@${ssh_host} $1
}

command_config=${argv[2]}
echo "prepared to read command config: ${command_config}"
REMOTE_HOME=$(run "pwd") source $command_config

for remote_command in ${remote_commands}; do
    echo "preparing to run ${remote_command}"
    run "${remote_command}"
done