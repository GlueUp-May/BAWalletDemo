# BAWalletDemo

# 请务必阅读完以下内容，再去使用

这是一个iOS终端的包含比特币和以太坊钱包的Demo程序，此应用非完全节点钱包，是一个适合移动设备使用的轻钱包，它只关心安全地保存好用户重要的私钥信息，并支持比特币账户的创建，发送比特币，接收比特币，查询钱包子账户，备份钱包，恢复钱包等功能。它不具有存储完整区块链数据，验证P2P网络广播的交易，挖矿等功能。

技术支持：

QQ：446156556 <br />
微信 ：446156556<br />
Email：abel_tu@163.com\beyondabel@gmail.com<br />
给予BTC支持: 13h6zY7RqKepnRAZkTUq2CSBACbY5E7pwG<br />
给予ETH支持: 0xf62b2b84d3555414e909aA36D6dC63cE5b3cf236

# 样例

在这个Demo中的ViewController已经例举了BTC和ETH如何创建、发送交易以及获取交易的样例。

# 计划

1. 预计6月30号之前实现ETH的ERC20
2. EOS钱包

# 风险提醒

本应用受限Apple设备，最重要的私钥信息保存在keychain中，Apple是否留有后门我们不得已知
钱包“恢复密语和密码”一旦丢失且没有备份，将永远无法找回，等于所有账户的资产丢失。
多重签名账户，需要保存好多个账户的私钥，如果私钥丢失到低于必要的签名数目，将永远无法使用多重签名账户的资产。“赎回脚本”也十分重要，一旦丢失需要重新生成。应用的“账户体系”中以包含保存多重签名账户的赎回脚本，为了更安全，应用也提供导出赎回脚本，让用户自行备份。
可信任的云节点一旦关闭，比特币资产不会丢失，但钱包将无法显示出资产余额，也无法发出比特币。这时候，要等开发者升级软件，跟换云节点才能继续使用。或者导出子账户的私钥，导入到其它支持导入私钥的客户端中恢复，继续使用。

#捐助计划

为了让开发者更积极分享技术，开源程序代码，我们发起数字货币捐助计划，捐款接收以下货币。

BTC Address: 13h6zY7RqKepnRAZkTUq2CSBACbY5E7pwG<br />
ETH Address: 0xf62b2b84d3555414e909aA36D6dC63cE5b3cf236
