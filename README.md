# 土味网络验证系统

## php, des加解密,rsa非对称加密，心跳验证

## js对接验证例子已经完成，验证测试例子网址：https://gitblog.koala9527.xyz/tw_js/RSA.html
## 有兴趣欢迎加群：182440207
## 开源原因
准备开发lua或者python对接的例子，lua的rsa加解密效率太慢了
二次开发github其他项目，其他项目停止维护了

本项目地址：https://tw.twgcs.xyz/

原项目的相关附件，没有修改
https://pan.baidu.com/s/1cB4hZhPcHlgsS2XjXrnB6A 提取码：5kuq


## 这个东西是干嘛的？

用途是给js所写的游戏脚本的进行收费管理

## 详细功能介绍

服务端（php）介绍：

* 官网，用于展示、注册登录、忘记密码等；
* 后台网站，用户统计、软件管理、注册码管理、推荐人规则等功能；
* 供客户端调用的接口，请求数据使用rsa和des加解密，确保封包安全；

客户端（dll）介绍：

* 登录；
* 试用；
* 解绑；
* 离线；
* 推荐人加时；

## 客户端接口（供脚本调用）

