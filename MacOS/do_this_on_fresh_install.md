# Set Mac Hostname to avoid it being changed (temporarily) via DHCP server

sudo scutil --set ComputerName <host-name-U-want>
sudo scutil --set HostName <host-name-U-want>
sudo scutil --set LocalHostName <host-name-U-want>
