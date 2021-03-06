#language: zh-CN

功能: 管理课程目录
  作为管理员，我应该可以向系统
    1) 查看现有目录列表
    2) 添加目录名称不重复的新目录；
    3) 修改现有的目录；
    4) 删除空目录；对于有课程的目录，不允许删除。
    5) 启用或禁用目录。目录一旦被禁用，它以及它下面的课程将被隐藏。

  背景:
    假如 我有如下目录:
      |name           |enabled    |
      |编程           |true       |
      |项目管理        |true       |
    而且 我有如下课程:
      |course_name    |status     |catalog      |
      #|设计模式        |open       |编程         |
      |软件估算        |open       |项目管理      |
    而且 我已经登录为管理员"edward_zhou"


  场景: 查看现有目录列表
    当 我位于 目录管理页面
    那么 我在 "#catalog_list" 里面 应当看到 "编程"
    而且 应当看到 "项目管理"


  场景: 添加目录名不重复的新目录
    假如 我位于 目录管理页面
    当 点击连接 "新建目录"
    而且 在 "名称" 填入 "数据库"
    而且 按下按钮 "保存"
    那么 我应当在页面 目录管理页面
    而且 应当看到 "保存成功"
    而且 在 "#catalog_list" 里面应当看到 "数据库"

  场景: 添加名称重复的新目录
    假如 我位于 目录管理页面
    当 我点击连接 "新建目录"
    而且 在 "名称" 填入 "编程"
    而且 按下按钮 "保存"
    那么 我应当看到 "名称 已经被使用"

  场景: 修改现有的目录
    假如 我位于 目录管理页面
    当 我在 "目录项(编程)" 里面 点击连接 "修改"
    而且 在 "名称" 填入 "编程2"
    而且 按下按钮 "保存"
    那么 我应当看到 "修改成功"
    而且 在 "#catalog_list" 里面应当看到 "编程2"

  场景: 修改名称重复的新目录
    假如 我位于 目录管理页面
    当 我在 "目录项(编程)" 里面 点击连接 "修改"
    而且 在 "名称" 填入 "项目管理"
    而且 按下按钮 "保存"
    那么 我应当看到 "名称 已经被使用"

  场景: 删除空目录
    假如 我位于 目录管理页面
    当 我在 "目录项(编程)" 里面 点击连接 "删除"
    #而且 按下按钮 "确定"
    那么 我应当看到 "删除成功"
    而且 在 "#catalog_list" 里面应当看不到 "编程"

  场景: 删除有课程的目录
    假如 我位于 目录管理页面
    当 我在 "目录项(项目管理)" 里面 点击连接 "删除"
    #而且 按下按钮 "确定"
    那么 我应当看到 "删除失败: 项目管理存在课程"
    而且 在 "#catalog_list" 里面应当看见 "项目管理"

  场景: 禁用目录
    假如 我位于 目录管理页面
    当 我在 "目录项(编程)" 里面 应当看到连接 "禁用"
    而且 我点击连接 "禁用"
    那么 我应当看到 "禁用成功"
    而且 在 "目录项(编程)" 里面应当看到连接 "启用"
    #而且 在 "div#catalog_nav" 里面应当看不到 "编程"





