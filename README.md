## 步骤

1. 生成.toc目录，把template.html拷贝进去
1. 生成preview目录
1. 编译markdown到preview目录
1. 读取路径，将css和js举例增加到template中


## 安装

	gem intall tocmd

## 用法

指定单个文件

	tocmd -f shiti.md
	
指定目录

	tocmd -d .
	
	
## Table test

|Keys|Value|
|----|-----|
|说明|检查用户是否已经登录|
|网址|index.php?c=mobile&a=checklogin|
|登录|FALSE|
|参数|NULL|
|返回|↓↓↓↓↓↓↓↓↓↓|


## History

- v0.1.4
	- 增加table支持
	
	