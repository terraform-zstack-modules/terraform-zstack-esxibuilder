#!/bin/bash
# 日志文件
LOG_FILE="/var/log/iso-builder-setup.log"

# 创建日志函数
log() {
  local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
  echo "[$timestamp] $1" | tee -a $LOG_FILE
}

log "开始安装必要工具"

# 更新包列表
log "更新包列表"
apt-get update -y >> $LOG_FILE 2>&1

# 安装必要工具
log "安装genisoimage和apache2"
apt-get install -y genisoimage apache2 wget >> $LOG_FILE 2>&1


# 创建ISO下载目录
log "创建ISO下载目录"
mkdir -p /var/www/html/iso
chmod 755 /var/www/html/iso

# 启动Apache服务
systemctl enable apache2 >> $LOG_FILE 2>&1
systemctl start apache2 >> $LOG_FILE 2>&1

log "安装和目录创建完成"
