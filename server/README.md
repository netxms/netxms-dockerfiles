# NetXMS Server docker image

Docker image of NetXMS Server (www.netxms.org). Currently limited to SQLlite database. Netxms files are located in docker volume /data.

Run with:
```bash
docker run registry.gitlab.com/matthew-beckett/netxms-dockerfiles/server:3-8-314
```

Environment Variables

NetXMS Server
- **NETXMSD_UNLOCK_ON_STARTUP** - set to 1 to unlock database on each container startup (default), set to 0 to skip database unlocking  
- **NETXMSD_UPGRADE_ON_STARTUP** - set to 1 to upgrade database on each container startup (default), set to 0 to skip database upgrading  
- **NETXMSD_DEBUG_LEVEL** - Variable to set server debug level (It is passed through command-line arguments)  
- **NETXMSD_CONFIG** - Variable to set arbitrary config file entries to _/data/netxmsd.conf_. Put your configuration options here.

