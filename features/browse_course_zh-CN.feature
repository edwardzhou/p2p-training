#language: zh-CN

功能: 浏览课程
  用户可以通过查看指定目录下的有效课程

  背景:
    假如 我有如下目录:
      |name           |enabled    |
      |编程           |true       |
      |项目管理        |true       |
    而且 我有如下课程:
      |course_name    |status     |catalog      |
      |设计模式        |open       |编程         |
      |软件估算        |open       |项目管理      |

  场景: 用户在首页点击目录查看课程
    假如 我位于 主页
    而且 我在 "div#catalog_nav" 里面点击连接 "编程"
    那么 我应当在页面 目录(编程)
    而且 I dump page content
    而且 我应当看到 "设计模式"



