# Secure ttyd Setup Guide
This guide walks you through installing, building, and running **ttyd**
(v1.7.7) from source with modern libwebsockets (v4.4-stable) for WebSocket ping
support, enabling stable SSL-encrypted sessions without idle timeouts. It
assumes Ubuntu/Debian (adapt package managers for other distros like Fedora:
`dnf` instead of `apt`). All commands are consolidated for ease—run as a
non-root user unless noted.

## Prerequisites
- Ubuntu 20.04+ (or equivalent; older distros may need manual libuv/libssl).
- Git, CMake, and build tools.
- Bash shell.

## Step 1: Install Build Dependencies
```bash
sudo apt update && sudo apt install git cmake build-essential pkg-config libssl-dev libuv1-dev libjson-c-dev
```

## Step 2: Build libwebsockets (v4.4-stable) with libuv & SSL Support
This enables the `-P` ping flag in ttyd for anti-idle.
```bash
cd /tmp && git clone https://github.com/warmcat/libwebsockets.git && cd libwebsockets
git checkout v4.4-stable
mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local -DLWS_WITH_SSL=ON -DLWS_WITH_LIBUV=ON
make -j$(nproc) && sudo make install
sudo ldconfig
```
Verify: `pkg-config --modversion libwebsockets` (should show 4.4.x).

## Step 3: Build ttyd (v1.7.7)
```bash
cd /tmp && git clone https://github.com/tsl0922/ttyd.git && cd ttyd
git checkout v1.7.7
mkdir build && cd build
cmake .. && make -j$(nproc)
sudo make install  # Installs to /usr/local/bin/ttyd
```
Verify: `ttyd --version` (should show 1.7.7) and `ttyd --help 2>&1 | grep ping` (lists `--ping-interval`).

## Step 4: Generate Self-Signed SSL Certificates
Store in `~/.ssh/` with ttyd prefix for easy reuse. Use `localhost` as CN for browser compatibility.
```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout ~/.ssh/ttyd-key.pem \
  -out ~/.ssh/ttyd-cert.pem \
  -subj "/C=UK/ST=MiddleEarth/CN=localhost"
```
- Secure them: `chmod 600 ~/.ssh/ttyd-*.pem`.
- Verify: `openssl x509 -in ~/.ssh/ttyd-cert.pem -text -noout` (check CN=localhost).

## Step 5: Run ttyd Securely
Consolidated command: HTTPS on port 7681, basic auth (`admin:MySecurePass123!`—change it!), WS pings every 5s, writable (`-W`), and initial output to prime the PTY.
```bash
ttyd -W -S -C ~/.ssh/ttyd-cert.pem -K ~/.ssh/ttyd-key.pem \
  -c admin:MySecurePass123! -P 5 -p 7681 "sh -c 'echo \"Session ready...\"; exec bash'"
```
- **Flags Breakdown**:
  - `-W`: Allow clients to write to the TTY.
  - `-S`: Enable SSL.
  - `-C/-K`: Cert/key paths.
  - `-c username:password`: Basic auth (prompts on connect).
  - `-P 5`: Ping interval (5s; prevents 20-30s SSL idle drops).
  - `-p 7681`: Port (custom; use 443 for prod with sudo).
- Logs: Watch for clean startup (e.g., "Listening on port: 7681") and WS connects ("WS /ws - 127.0.0.1").
- Stop: Ctrl+C.

For multi-user auth or longer timeouts, consider a reverse proxy like Nginx (optional, not covered here).

## Step 6: Connect Securely
1. Open browser: `https://localhost:7681` (or `https://your-ip:7681` for remote).
2. Accept self-signed cert warning (Advanced > Proceed; safe for local use).
3. Enter credentials (`admin` / `MySecurePass123!`) in the popup.
4. Terminal loads—type away! Idle sessions stay alive via pings.
   - Disconnect? Press Enter to auto-reconnect (built-in).
5. Remote access: Bind to `0.0.0.0` (add `-i 0.0.0.0`), firewall it (`ufw allow from your-ip to any port 7681`), and use your domain/IP.

Pro tip: For prod, use Let's Encrypt certs (`certbot`) instead of self-signed.

## Troubleshooting
- **CMake Errors (libuv)**: Ensure `libuv1-dev` installed; rebuild libwebsockets with `-DLWS_WITH_LIBUV=ON`.
- **Idle Drops**: Crank `-P 1` (1s pings).
- **No Ping Flag**: libwebsockets <4.0—rebuild as above.
- **Browser ERR_SSL_PROTOCOL_ERROR**: Clear Chrome HSTS (`chrome://net-internals/#hsts`), disable QUIC (`chrome://flags`), or test in Firefox.

## Alternatives
If builds frustrate: Use WeTTY (`npm i -g wetty`) for no-compile SSL/idle-proof sessions.
