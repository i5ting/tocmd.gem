## 步骤

1. 生成.toc目录，把template.html拷贝进去
1. 生成preview目录
1. 编译markdown到preview目录
1. 读取路径，将css和js举例增加到template中


## 安装

	gem intall tocmd
	
## 命令

- tocmd 
- tocmd_local

## 用法


### tocmd

指定单个文件

	tocmd -f shiti.md
	
指定目录

	tocmd -d .
	
### tocmd_local
	

指定单个文件

	tocmd_local -f shiti.md
	
指定目录

	tocmd_local -d .
	
	
## History


- v0.1.5
	- 重构代码命名,把测试一道sample.md中
- v0.1.4
	- 增加table支持
