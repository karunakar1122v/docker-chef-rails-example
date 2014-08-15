FROM ubuntu:14.04

# ADD rails-example/run.sh /config/rails-example/run.sh
# RUN chmod +x /config/rails-example/run.sh
# 
# ADD nginx/run.sh /config/nginx/run.sh
# RUN chmod +x /config/nginx/run.sh
# ADD nginx/nginx.conf /config/nginx/nginx.conf
# 
# RUN mkdir -p /log/nginx
# RUN mkdir -p /log/rails-example

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["/config", "/gems", "/log"]

CMD /bin/bash
