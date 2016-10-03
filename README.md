# Supervisor monitoring docker
A tool for monitoring supervisor
- Run with `docker run --detach --tty --restart=always --name=cesi --net=mynetwork -v /home/user/cesi/log:/var/log -v /home/user/cesi/data:/data -e NODES="mail-server,duplicati" shervinkh/cesi` (Containers specified in`NODES` should be in the same network)
- Server is available at port `5000`

