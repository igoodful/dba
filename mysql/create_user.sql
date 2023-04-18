create user 'dba'@'%' identified by 'password';
grant all on *.* to 'dba'@'%';
create user 'repl'@'%' identified by 'password';
grant replication slave, replication client on *.* to 'repl'@'%';
create user 'backup'@'%' identified by 'password';
grant select,process,super,trigger,event,show view,reload,lock tables,replication client,replication slave on *.*  to 'backup'@'%';
create user 'monitor'@'localhost' identified by 'password';
grant process, show databases, replication client, super, select on *.* to 'monitor'@'localhost';
