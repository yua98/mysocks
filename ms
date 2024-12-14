{
    "dns": {
        "rules": [
            {
                "outbound": [
                    "节点选择"
                ],
                "server": "remote"
            },
            {
                "rule_set": [
                    "geosite-cn"
                ],
                "server": "remote"
            }
        ],
        "servers": [
            {
                "address": "1.1.1.1",
                "detour": "节点选择",
                "tag": "remote"
            },
            {
                "address": "https://223.5.5.5/dns-query",
                "detour": "节点选择",
                "tag": "local"
            },
            {
                "address": "rcode://refused",
                "tag": "block"
            }
        ],
        "final": "remote",
        "strategy": "ipv4_only",
        "disable_cache": false
    },
    "experimental": {
        "cache_file": {
            "enabled": true
        },
        "clash_api": {
            "default_mode": "全局代理",
            "external_controller": "127.0.0.1:9090",
            "secret": ""
        }
    },
    "inbounds": [
        {
            "auto_route": true,
            "domain_strategy": "prefer_ipv4",
            "endpoint_independent_nat": true,
            "inet4_address": "172.19.0.1/30",
            "inet6_address": "2001:0470:f9da:fdfa::1/64",
            "mtu": 9000,
            "sniff": true,
            "sniff_override_destination": true,
            "stack": "system",
            "strict_route": true,
            "type": "tun"
        },
        {
            "domain_strategy": "prefer_ipv4",
            "listen": "127.0.0.1",
            "listen_port": 2333,
            "sniff": true,
            "sniff_override_destination": true,
            "tag": "socks-in",
            "type": "socks",
            "users": []
        },
        {
            "domain_strategy": "prefer_ipv4",
            "listen": "127.0.0.1",
            "listen_port": 2334,
            "sniff": true,
            "sniff_override_destination": true,
            "tag": "mixed-in",
            "type": "mixed",
            "users": []
        }
    ],
    "outbounds": [
        {
            "type": "dns",
            "tag": "dns-out"
        },
        {
            "tag": "🇭🇰ClawHK-VmissHK",
            "type": "shadowsocks",
            "server": "8.210.209.48",
            "server_port": 43162,
            "method": "chacha20-ietf-poly1305",
            "password": "299b6488-3a0d-4052-9637-98d4e33a0d7a"
        },
        {
            "tag": "🇭🇰ClawHK-AkileHK",
            "type": "shadowsocks",
            "server": "8.210.209.48",
            "server_port": 59951,
            "method": "chacha20-ietf-poly1305",
            "password": "299b6488-3a0d-4052-9637-98d4e33a0d7a"
        },
        {
            "tag": "🇺🇸ClawHK-AkileUS",
            "type": "shadowsocks",
            "server": "8.210.209.48",
            "server_port": 56833,
            "method": "chacha20-ietf-poly1305",
            "password": "299b6488-3a0d-4052-9637-98d4e33a0d7a"
        },
        {
            "tag": "🇭🇰Dler04Std-VmissHK",
            "type": "shadowsocks",
            "server": "iepl.std.8932.0tk8a3a1q4t94dler.com",
            "server_port": 19597,
            "method": "chacha20-ietf-poly1305",
            "password": "299b6488-3a0d-4052-9637-98d4e33a0d7a"
        },
        {
            "tag": "🇭🇰Dler03Std-VmissHK",
            "type": "shadowsocks",
            "server": "iepl.std.7541.0tk8a3a1q4t94dler.com",
            "server_port": 19597,
            "method": "chacha20-ietf-poly1305",
            "password": "299b6488-3a0d-4052-9637-98d4e33a0d7a"
        }
    ],
    "route": {
        "auto_detect_interface": true,
        "rules": [
            {
                "outbound": "dns-out",
                "protocol": "dns"
            },
            {
                "clash_mode": "全局代理",
                "outbound": "🇭🇰ClawHK-VmissHK"
            },
            {
                "rule_set": [
                    "geosite-cn",
                    "geoip-cn"],
                "outbound": "🇭🇰ClawHK-VmissHK"
            },
            {
                "ip_is_private": true,
                "outbound": "🇭🇰ClawHK-VmissHK"
            }
        ],
        "rule_set": [
            {
                "tag": "geosite-cn",
                "type": "remote",
                "format": "binary",
                "url": "https://raw.githubusercontent.com/SagerNet/sing-geosite/rule-set/geosite-cn.srs",
                "download_detour": "节点选择"
            },
            {
                "tag": "geoip-cn",
                "type": "remote",
                "format": "binary",
                "url": "https://raw.githubusercontent.com/Loyalsoldier/geoip/release/srs/cn.srs",
                "download_detour": "节点选择"
            }
        ]
    }
}
