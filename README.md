# Tocmd is a ruby gem

tocmd 是一个ruby gem，用于把markdown文件生成带有toc目录的html文档。

`说明：目前代码比较乱，没有重构.....`

根据h1到h6标题生成toc内容大纲，采用的jquery插件[i5ting_ztree_toc](https://github.com/i5ting/i5ting_ztree_toc)。

![](https://github.com/i5ting/i5ting_ztree_toc/raw/master/demo/3.png)

## Markdown生成步骤

1. 生成.toc目录，把template.html拷贝进去
1. 生成preview目录
1. 编译markdown到preview目录
1. 读取路径，将css和js举例增加到template中

## 安装方法

	gem intall tocmd
	
## 命令概览

- tocmd 

		把用到的资源文件放到gem目录下，没有放到preview目录下使用方便，但是当你本地，可以节省空间，避免多次copy

- tocmd_local

		把用到的资源文件放到preview目录下
	
- tocmd_conf

		和tocmd_local是一样的，都是把js等资源文件放到当前目录下，差别在于读取toc_conf.js文件作为配置，这样利于多次编译markdown的时候一次配置。

## 用法

目前3个命令，参数都一样，分别如下

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
	
### tocmd_conf

和tocmd_local是一样的，都是把js等资源文件放到当前目录下，差别在于读取toc_conf.js文件作为配置，
这样利于多次编译markdown的时候一次配置。

示例配置项

	var jquery_ztree_toc_opts = {
		debug:false,
		is_auto_number:false,
		documment_selector:'.markdown-body',
		ztreeStyle: {
			width:'290px',
			overflow: 'auto',
			position: 'fixed',
			'z-index': 2147483647,
			border: '0px none',
			left: '0px',
			top: '0px',
			'height': $(window).height() + 'px'
		}
	}
	var markdown_panel_style = {
		'width':'70%',
		'margin-left':'20%'
	};


修改'height': $(window).height() + 'px'，这样就可以占满屏幕，支持tree的滑动
	
### 自定义修改i5ting_ztree_toc配置项

请自己按需修改，如有疑问，请到[i5ting_ztree_toc](https://github.com/i5ting/i5ting_ztree_toc)去提issue，我会尽力回复的

i5ting_ztree_toc的配置项如下：

```
//定义默认
$.fn.ztree_toc.defaults = {
	_zTree: null,
	_headers: [],
	_header_offsets: [],
	_header_nodes: [{ id:1, pId:0, name:"Table of Content",open:true}],
	debug: true,
	highlight_offset: 0,
	highlight_on_scroll: true,
	/*
	 * 计算滚动判断当前位置的时间，默认是50毫秒
	 */
	refresh_scroll_time: 50,
	documment_selector: 'body',
	is_posion_top: false,
	/*
	 * 默认是否显示header编号
	 */
	is_auto_number: false,
	/*
	 * 默认是否展开全部
	 */	
	is_expand_all: true,
	/*
	 * 是否对选中行，显示高亮效果
	 */	
	is_highlight_selected_line: true,
	step: 100,
	.....................
};
```

## Test  in development mode

	ruby -Ilib bin/tocmd -d test_data/dir
	ruby -Ilib bin/tocmd -f test_data/sample.md
	ruby -Ilib bin/tocmd_local -d test_data/dir
	ruby -Ilib bin/tocmd_local -f test_data/sample.md
	

用于翻译

	ruby -Ilib bin/tocmd_conf -f test_data/sample2.md  
	
## History


- 0.4.1
	- 不在生成toc_conf.js,而是直接使用toc/toc_conf.js
- 0.4.0
	- 正式支持翻译英文文档
- 0.3.2
	- 修正依赖问题，之前忘记加了，以为放到gemfile就可以呢，反思
- 0.3.1
	- 修正创建toc_conf.js时shell问题
- v0.3.0
	- 增加了tocmd_conf命令，把用到的资源文件放到src目录下,增加`.toc_conf`
- v0.2.0
	- 增加了tocmd_local命令，把用到的资源文件放到preview目录下
- v0.1.6
	- 去掉了autolink
- v0.1.5
	- 重构代码命名,把测试一道sample.md中
- v0.1.4
	- 增加table支持

## 欢迎fork和反馈

在issue提问或邮件shiren1118@126.com

## License

this gem is released under the [MIT License](http://www.opensource.org/licenses/MIT)