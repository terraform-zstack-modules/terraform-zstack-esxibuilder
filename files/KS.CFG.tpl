vmaccepteula

rootpw ${esxi_root_password}

install --firstdisk --overwritevmfs

network --bootproto=dhcp --device=vmnic0

reboot

%firstboot --interpreter=busybox

vim-cmd hostsvc/enable_ssh
vim-cmd hostsvc/start_ssh