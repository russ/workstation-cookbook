#execute "install_dotfiles" do
#  command "curl -L https://raw.github.com/russ/dotfiles/master/install.sh | sh"
#  creates "~/.files"
#  action :run
#end

# git "/Users/#{node['current_user']}/.files" do
#   repository "https://github.com/russ/dotfiles.git"
#   revision "master"
#   notifies :run, "execute[symlink_dotfiles]"
#   user node['current_user']
# end
# 
# execute "symlink_dotfiles" do
#   command "/Users/#{node['current_user']}/.files/symlink_dotfiles.sh"
#   user node['current_user']
#   action :nothing
# end
