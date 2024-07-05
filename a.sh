#!/bin/bash

# 定义红色字体显示的函数
red_text() {
  echo "\033[31m$1\033[0m"
}

# 显示红色欢迎信息
red_text "欢迎使用小洛青自助换源脚本

# 等待5秒
sleep 4

# 清屏
clear

# 显示菜单并获取用户输入
echo "请选择要切换的源（输入对应的数字）:"
echo "(1): 华为源-Centos7～8（可用）"
echo "(2): 网易源-Centos7 (可用)\n"
echo "------------------------------------"
echo "(a1): 更新脚本（从yum.jzvps.top/a.sh下载并执行）"
read -p "输入对应数字: " choice

#but
case $choice in
  1)
    red_text "正在切换到华为源..."
    wget -O /etc/yum.repos.d/CentOS-Base.repo https://repo.huaweicloud.com/repository/conf/CentOS-7-anon.repo
    red_text "切换完成-一秒后自动开始更新"
    sleep 1
    clear
    yum clean all
    yum makecache
    ;;
  2)
   red_text "正在切换到网易源..."
   wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.163.com/.help/CentOS7-Base-163.repo
   red_text "切换完成-一秒后自动开始更新"
    sleep 1
    clear
    yum clean all
    yum makecache
    ;;
  a1)
    red_text "正在加载节点下载并执行更新脚本..."
   wget http://yum.jzvps.top/a.sh
   sleep 5
   exit
   red_text "更新完成，请重新执行此脚本"
   
    ;;
  *)
    red_text "无效的输入，脚本将重新启动。"
    sleep 1
    clear
    sh a.sh
    ;;
esac



