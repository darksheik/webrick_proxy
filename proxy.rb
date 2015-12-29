require 'webrick'
require 'webrick/httpproxy'

# ARGUMENTS: local_port proxy_host proxy_port proxy_user proxy_pass

proxy = WEBrick::HTTPProxyServer.new Port: ARGV[0], ProxyURI: URI("http://#{ARGV[3]}:#{ARGV[4]}@#{ARGV[1]}:#{ARGV[2]}")

trap 'INT'  do proxy.shutdown end
trap 'TERM' do proxy.shutdown end

proxy.start
