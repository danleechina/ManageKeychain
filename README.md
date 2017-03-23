If you need English document for this project, [`ManageKeychain ` English document](https://github.com/danleechina/ManageKeychain/blob/master/README-en.md)

# ManageKeychain

该项目的作用是，可以在越狱手机上直接查看手机 keychain 数据库下的所有数据。

通过使用 [Keychain-Dumper](https://github.com/ptoomey3/Keychain-Dumper)，我们可以将 iPhone 上的 keychain 列表给导出来。但是 Keychain-Dumper 呈现的数据不够全面，同时只能导出来以后在 Mac 上查看，而且不支持修改操作。

# 使用方式

1. 需要安装配置 TheOS 越狱开发环境
2. 在项目根目录执行 `CER="iPhone Developer: YourDevCertName (XXXXXX)" make packe install`，注意配置证书名称，同时修改 TheOS 配置文件的远程手机 IP 地址
3. ssh 到 iPhone，在 /Applications/ManageKeyChain.app 执行 `chown root ManageKeyChain `
4. 点击屏幕即可运行程序

# TODO

1. 每次查看 identity， key 等数据滑到最下面，再返回 crash
2. 目前只支持查看数据，后面需要增加修改数据的功能

# 贡献者

作者: [@粉碎音箱的音乐(weibo)](http://weibo.com/u/1172595722) 

Blog: [Blog](http://danleechina.github.io/)

# 需要 Star！

如果你觉得 `ManageKeychain ` 有用的话，请点个 star 呗！谢谢啦。😄

