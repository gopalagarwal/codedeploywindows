New-WebSite -Name server1 -Port 1111 -PhysicalPath 'c:\\inetpub\\wwwroot\\MusicWorld' -Force
netsh advfirewall firewall add rule name='Open Port 1111' dir=in action=allow protocol=TCP localport=1111