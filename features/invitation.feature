#language: zh-CN

功能: 邀请推广
  作为用户，我应该能够
    1) 邀请朋友注册以获得推广积分
    2) 查看成功的邀请
    3) 查看未接受的邀请
    4) 对于未接受的邀请再次发送邀请

  背景:
    假如 我有如下目录:
      |name           |enabled    |
      |编程           |true       |
      |项目管理        |true       |
      |软件工程        |true       |
    而且 我有如下课程:
      |course_name    |status     |catalog      |
      |设计模式        |open       |编程         |
      |软件估算        |open       |项目管理      |
    而且 我已经登录为"edward_zhou"

  场景: 发送邀请
    假如 我打开 <invitations> 页面
    当 我点击链接 "邀请朋友"
    而且 在 "朋友邮件地址" 填入 "nobody@nobody.com"
    而且 按下按钮 "提交"
    那么 我应当看到 "发送邀请成功"
