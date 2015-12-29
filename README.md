# webrick_proxy
A locally-running proxy server that will forward and authenticate to an upstream proxy.

I had a need to authenticate to an upstream proxy for a single session as a different user, and I didn't want to have to enter authorization credentials in the browser popup.  Figured this would be a relatively easy tool to find out there, but I spent weeks looking for it.

The closest thing I found was Squid, but Squid is a constantly running service and requires a configuration file.  You'd need to restart it every time you wanted to change the settings.

Webrick to the rescue!

Install the gem:

```
gem install webrick
```

Then start your proxy on the command line with the following arguments:

```
ruby proxy.rb <local port> <upstream proxy host> <upstream proxy port> <upstream proxy username> <upstream proxy password>
```

This will of course make the username and password for the upstream proxy completely visible to those who can view the processes, but I am indifferent for my use case. :)
