execute 'install_dotfiles' do
  cwd "/Users/#{node['current_user']}"
  command 'git clone https://github.com/russ/dotfiles.git'
  creates '~/.dotfiles'
  action :run
  not_if { ::File.exists?("/Users/#{node['current_user']}") }
end

git "/Users/#{node['current_user']}/.dotfiles" do
  repository 'https://github.com/russ/dotfiles.git'
  revision 'master'
  notifies :run, 'execute[symlink_dotfiles]'
  user node['current_user']
end

execute 'symlink_dotfiles' do
  cwd "/Users/#{node['current_user']}/.dotfiles"
  command 'rake install'
  user node['current_user']
  creates '~/.bash_profile'
  action :run
end
