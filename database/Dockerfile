FROM mysql:5.7

EXPOSE 3306

# db info
ENV  MYSQL_DATABASE training
ENV  MYSQL_USER training
ENV  MYSQL_PASSWORD hoge0515
ENV  MYSQL_ROOT_PASSWORD root

COPY ./my.cnf /etc/mysql/conf.d/my.cnf

CMD ["mysqld"]
