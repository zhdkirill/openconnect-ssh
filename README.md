# Openconnect + SSH
Minimalistic image to provide VPN connectivity with ssh server
[Docker hub](https://hub.docker.com/r/zhdkirill/openconnect-ssh)

## Usage
- Openconnect supports various connection protocols like Cisco AnyConnect or PAN GlobalProtect
- Openconnect starts with options provided via environmental variables
- The image requires `net_admin` cap and access to `tun` device
- Default user shell is set to `/sbin/nologin` as it is supposed to work as jumphost only

## Variables
| Variable | Description |
| :------- | :-----------|
| `HOST` | Host for Openconnect to connect to |
| `USER` | Login user for Openconnect |
| `PASSWORD` | Password for Openconnect |
| `PROTOCOL` | Protocol to use for Openconnect (optional) |
| `CERTIFICATE` | Path to certificate file for Openconnect authorization (optional) |
| `SSH_USER` | User for SSH login |
| `SSH_KEYS` | Public keys for SSH authentication

### Sample docker-compose file
```
services:
  openconnect:
    container_name: openconnect-ssh
    image: zhdkirill/openconnect-ssh
    cap_add:
    - net_admin
    devices:
    - /dev/net/tun
    environment:
      HOST: vpn.example.com
      USER: user
      PASSWORD: password
      SSH_USER: jump
      SSH_KEYS: |
        ssh-ed25519 AAAA...
        ssh-rsa AAAA...
    ports:
    - "2222:22"
```
