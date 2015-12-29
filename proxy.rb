require 'webrick'
require 'webrick/httpproxy'

local_port, proxy_host, proxy_port, proxy_user, proxy_pass = ARGV

if ARGV[3]
  proxy = WEBrick::HTTPProxyServer.new Port: local_port, ProxyURI: URI("http://#{proxy_user}:#{proxy_pass}@#{proxy_host}:#{proxy_port}")
elsif ARGV[1]
  proxy = WEBrick::HTTPProxyServer.new Port: local_port, ProxyURI: URI("http://#{proxy_host}:#{proxy_port}")
else
  proxy = WEBrick::HTTPProxyServer.new Port: local_port || 8000
end

trap 'INT'  do proxy.shutdown end
trap 'TERM' do proxy.shutdown end

proxy.start
