# 使用Python 3.8的官方映像作为基础
FROM python:3.8

# 设置工作目录
WORKDIR /app

# 安装项目所需的依赖
COPY requirements.txt .
RUN pip install -r requirements.txt

# 添加Crontab文件
COPY crontab /etc/cron.d/crontab

# 给Crontab文件添加执行权限
RUN chmod 0644 /etc/cron.d/crontab

# 启动Crontab服务
RUN crontab /etc/cron.d/crontab

# 定义容器启动时执行的命令
CMD cron && python main.py

