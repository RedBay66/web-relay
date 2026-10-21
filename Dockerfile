FROM teddysun/xray:latest
CMD sh -c 'cat > /etc/xray/config.json <<J
{"log":{"loglevel":"warning"},"inbounds":[{"listen":"0.0.0.0","port":${PORT:-10000},"protocol":"vless","settings":{"clients":[{"id":"${UUID}"}],"decryption":"none"},"streamSettings":{"network":"ws","wsSettings":{"path":"${WSPATH}"}}}],"outbounds":[{"protocol":"freedom"}]}
J
exec xray run -c /etc/xray/config.json'
