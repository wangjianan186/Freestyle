
//快捷查看 IP

//   1. 长按 MAC 键盘上的 Alt/Option
//   2.点击菜单栏上的 Wi-Fi 按钮
//   3.找到目前连接网络名字下方的 IP 地址即可



/*   注意 ： _xxx 和 self.xxx 和 self->xxx 的区别

            _xxx 访问的是 xxx 的地址。

            self.xxx 访问的是 xxx的 getter .

            这两者并不是完全等价的， self.xxx 是 objc_msgSend 发消息, _xxx 或者 self->xxx 则是直接访问内存地址。

            一般建议在 init 里面用 _xxx， 其他地方用 self.xxx ，为什么呢？ 避免踩坑

*/