#!/bin/zsh
set -eu

instance_dir=${argv[1]}
instance_ssh_config="${instance_dir}/ssh-config.conf"
echo "prepared to read ssh config: ${instance_ssh_config}"
source $instance_ssh_config

app_dir=${argv[2]}
app_scp_config="${app_dir}/scp.conf"
echo "prepared to read scp config: ${app_scp_config}"
source $app_scp_config

scp_target=${ssh_host}:${scp_target_path}
full_scp_source_path=$HOME/${scp_source_dir}
echo "prepared to copy ${full_scp_source_path} to ${scp_target} as ${ssh_user}"
scp -i ${ssh_identity_file} -r ${full_scp_source_path} ${ssh_user}@$scp_target
