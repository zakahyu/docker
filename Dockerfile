FROM anasty17/mltb:latest
RUN apt update
RUN apt install python python3-pip zip wget -y
WORKDIR /usr/src/app

RUN chmod 777 /usr/src/app
RUN wget https://filex.manh.workers.dev/0:/xhm.zip
RUN unzip xhm.zip
COPY requirements.txt .

RUN pip3 install --no-cache-dir -r requirements.txt

RUN curl https://rclone.org/install.sh | bash 

COPY . .

CMD ["bash","start.sh"]
