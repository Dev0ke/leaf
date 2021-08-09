## Simple Package Management For BLFS 10.0 Systemd

## Leaf

使用方法：将必要的文件放置于正确的位置。

```bash
mkdir -pv /var/lib/leaf/{cache,package}
touch /var/lib/leaf/status
install -m755 leaf /usr/bin
install -m644 leaf.conf /etc
cp -r pkgbuild /var/lib/leaf
```

注意事项：

1.BLFS所用的软件包下载地址一般能在BLFS手册中找到，package_url收集不太好找的软件

2.install_log记录一次成功安装Xorg的软件安装顺序，你可以根据依赖适当调整

3.pkgbuild存放一些软件编译的脚本，由leaf执行；leaf.conf是leaf的配置文件

4.xorg-apps.sh、xorg-fonts.sh、xorg-libs.sh由root用户手动执行，原因是它们是一组包而不是一个压缩包

5.事先把systemd-units-20200828解压到${LEAF_DIR}/cache，比如在安装dhcpcd时会创建对应的服务项

6.在构建llvm-10.0.1.src的时候可能机器会卡死，ninja -jN，N的值越小，越不容易宕机

7.在配置make-ca-1.7时，会使用wget下载证书，你可以在chroot中配置/etc/resolv.conf获取DNS，也可以直接在连接网络的情况下使用dhcpcd获取DNS
