# LXDSegmentControl
三种不同样式的分栏控制器。包括点击后移动滑块效果。选中后变色。选中内容放大效果

# 相关类定义
* LXDSegmentControlConfiguration   用来配置分栏控制器的显示属性
* LXDSegmentControl   分栏控制器

# 类型枚举
* LXDSegmentControlTypeSlideBlock   分栏控制器是滑块样式，点击分栏按钮移动滑块
* LXDSegmentControlTypeSelectBlock  分栏控制器是圆角矩形样式，点击分栏按钮切换选中颜色
* LXDSegmentControlTypeScaleTitle   分栏控制器是标题样式，点击分栏按钮放大选中标题

# 回调方式
* 遵守LXDSegmentControlDelegate协议在实现点击按钮回调方法
* 监听LXDSegmentControlSelectIndexNotification通知，通过LXDSegmentControlIndexKey获取选中下标

# 使用方法
//配置分栏控制器按钮数据数组<br>
`LXDSegmentControlConfiguration * configuration = [LXDSegmentControlConfiguration configurationWithControlType: LXDSegmentControlTypeSlideBlock items: @[@"红", @"绿", @"蓝"]];`<br>
//使用配置对象创建分栏控制器<br>
`LXDSegmentControl * segmentControl = [LXDSegmentControl segmentControlWithFrame: CGRectMake(CGRectGetWidth(self.view.frame) * 0.5f - 100.f, 10.f, 200.f, 30.f) configuration: configuration delegate: self];`<br>

# 自定义属性
LXDSegmentControlConfiguration * configuration = [LXDSegmentControlConfiguration configurationWithItems: items];<br>
configuration.backgroundColor = [UIColor orangleColor];   //分栏控制器背景颜色<br>
configuration.cornerRadius = 5.f;         //分栏控制器圆角半径<br>
configuration.cornerWidth = 0.5f;         //分栏控制器边缘宽度<br>
configuration.itemBackgroundColor = [UIColor blueColor];  //分栏按钮背景颜色<br>
······<br>
LXDSegmentControl * segmentControl = [LXDSegmentControl segmentControlWithFrame:<br> CGRectMake(CGRectGetWidth(self.view.frame) * 0.5f - 100.f, 10.f, 200.f, 30.f) configuration: configuration delegate: self]<br>
