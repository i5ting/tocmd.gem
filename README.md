# tocmd is a ruby gem

tocmd 是一个ruby gem，用于把markdown文件生成带有toc目录的html文档。

toc生成采用的jquery插件[i5ting_ztree_toc](https://github.com/i5ting/i5ting_ztree_toc)。

![](https://github.com/i5ting/i5ting_ztree_toc/raw/master/demo/3.png)

## markdown生成步骤

1. 生成.toc目录，把template.html拷贝进去
1. 生成preview目录
1. 编译markdown到preview目录
1. 读取路径，将css和js举例增加到template中


## 安装

	gem intall tocmd
	
## 命令

- tocmd 

把用到的资源文件放到gem目录下，没有放到preview目录下使用方便，但是当你本地，可以节省空间，避免多次copy

- tocmd_local

把用到的资源文件放到preview目录下

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
	ztreeStyle: {
		width:'260px',
		overflow: 'auto',
		position: 'fixed',
		'z-index': 2147483647,
		border: '0px none',
		left: '0px',
		bottom: '0px',
		// height:'100px'
	},
	ztreeSetting: {
		view: {
			dblClickExpand: false,
			showLine: true,
			showIcon: false,
			selectedMulti: false
		},
		data: {
			simpleData: {
				enable: true,
				idKey : "id",
				pIdKey: "pId",
				// rootPId: "0"
			}
		},
		callback: {
			beforeClick: function(treeId, treeNode) {
				$('a').removeClass('curSelectedNode');
				if(treeNode.id == 1){
					// TODO: when click root node
					console.log('click root table of content');
				}
				if($.fn.ztree_toc.defaults.is_highlight_selected_line == true) {
					$('#' + treeNode.id).css('color' ,'red').fadeOut("slow" ,function() {
					    // Animation complete.
						$(this).show().css('color','black');
					});
				}
			},
			onRightClick: function(event, treeId, treeNode) {
				if(treeNode.id == 1){
					// TODO: when right_click root node:table content
					console.log('right_click root table of content');
				}
			}
		}
	}
};
```

## Test  in development mode

	ruby -Ilib bin/tocmd -d test_data/dir
	ruby -Ilib bin/tocmd -f test_data/sample.md
	ruby -Ilib bin/tocmd_local -d test_data/dir
	ruby -Ilib bin/tocmd_local -f test_data/sample.md
	
## History

- v0.2.0
	- 增加了tocmd_local命令，把用到的资源文件放到preview目录下
- v0.1.6
	- 去掉了autolink
- v0.1.5
	- 重构代码命名,把测试一道sample.md中
- v0.1.4
	- 增加table支持

## License

this gem is released under the [MIT License](http://www.opensource.org/licenses/MIT)