#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
# DIY扩展二合一了，在此处可以增加插件
# 自行拉取插件之前请SSH连接进入固件配置里面确认过没有你要的插件再单独拉取你需要的插件
# 不要一下就拉取别人一个插件包N多插件的，多了没用，增加编译错误，自己需要的才好
# 修改IP项的EOF于EOF之间请不要插入其他扩展代码，可以删除或注释里面原本的代码

# 添加UA2F
git clone https://github.com/Zxilly/UA2F package/UA2F
cd package/UA2F
git checkout 20210531T234622
cd ../..
# 更新queue
svn checkout https://github.com/openwrt/packages/trunk/libs/libnetfilter-queue package/libs/libnetfilter-queue

cat >$NETIP <<-EOF
uci set network.lan.ipaddr='192.168.2.2'                                    # IPv4 地址(openwrt后台地址)
uci set network.lan.netmask='255.255.255.0'                                 # IPv4 子网掩码
uci set network.lan.gateway='192.168.2.1'                                   # IPv4 网关
uci set network.lan.broadcast='192.168.2.255'                               # IPv4 广播
uci set network.lan.dns='114.114.114.114 223.5.5.5'                         # DNS(多个DNS要用空格分开)
uci set network.lan.delegate='0'                                            # 去掉LAN口使用内置的 IPv6 管理
uci commit network                                                          # 不要删除跟注释,除非上面全部删除或注释掉了
#uci set dhcp.lan.ignore='1'                                                 # 关闭DHCP功能
#uci commit dhcp                                                             # 跟‘关闭DHCP功能’联动,同时启用或者删除跟注释
uci set system.@system[0].hostname='desktop-'                            # 修改主机名称为OpenWrt-123
EOF
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile           # 选择argon为默认主题

# sed -i "s/OpenWrt /${Author} Compiled in $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" $ZZZ          # 增加个性名字${Author}默认为你的github账号
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0/$1$O11bWZBh$unPDQhvSpv03xplz8lm2G0:18896/g' package/emortal/default-settings/files/zzz-default-settings
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0/$1$K8/hZkV0$9JIcU2UgNv.ApnS6Q3RGj.:18631/g' package/lean/default-settings/files/zzz-default-settings
# K3专用，编译K3的时候只会出K3固件
#sed -i 's|^TARGET_|# TARGET_|g; s|# TARGET_DEVICES += phicomm_k3|TARGET_DEVICES += phicomm_k3|' target/linux/bcm53xx/image/Makefile



# 修改插件名字
sed -i 's/"aMule设置"/"电驴下载"/g' `grep "aMule设置" -rl ./`
sed -i 's/"网络存储"/"NAS"/g' `grep "网络存储" -rl ./`
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' `grep "Turbo ACC 网络加速" -rl ./`
sed -i 's/"实时流量监测"/"流量"/g' `grep "实时流量监测" -rl ./`
sed -i 's/"KMS 服务器"/"KMS激活"/g' `grep "KMS 服务器" -rl ./`
sed -i 's/"终端"/"命令窗"/g' `grep "终端" -rl ./`
sed -i 's/"USB 打印服务器"/"打印服务"/g' `grep "USB 打印服务器" -rl ./`
sed -i 's/"Web 管理"/"Web"/g' `grep "Web 管理" -rl ./`
sed -i 's/"管理权"/"改密码"/g' `grep "管理权" -rl ./`
sed -i 's/"Argon 主题设置"/"Argon设置"/g' `grep "Argon 主题设置" -rl ./`
