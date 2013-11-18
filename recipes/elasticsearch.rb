brew 'elasticsearch'

execute 'install elasticsearch-head plugin' do
  command '/usr/local/Cellar/elasticsearch/0.90.7/bin/plugin --silent --install mobz/elasticsearch-head'
  user node['current_user']
  not_if { ::File.exists?('/usr/local/var/lib/elasticsearch/plugins/head') }
end

execute 'auto start elasticsearch' do
  command 'ln -sfv /usr/local/opt/elasticsearch/*.plist ~/Library/LaunchAgents'
  user node['current_user']
end

execute 'start elasticsearch now' do
  command 'launchctl load ~/Library/LaunchAgents/homebrew.mxcl.elasticsearch.plist'
  user node['current_user']
end
