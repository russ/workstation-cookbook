include_recipe "sprout-osx-apps::dropbox"

ssh_dir = "/Users/#{node['current_user']}/.ssh"
ssh_dbox_dir = "/Users/#{node['current_user']}/Dropbox/Hold/ssh_config"

link ssh_dir do
  to ssh_dbox_dir
  owner node['current_user']
  mode 0700
end
