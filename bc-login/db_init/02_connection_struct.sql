/**
 * @Author: Christian Langer <icedtux>
 * @Date:   2018-11-25T16:24:06+01:00
 * @Filename: 00_connection_struct.sql
 * @Last modified by:   icedtux
 * @Last modified time: 2018-11-25T17:10:41+01:00
 */
 /* mysql> desc guacamole_connection_group;
 +--------------------------+------------------------------------+------+-----+----------------+----------------+
 | Field                    | Type                               | Null | Key | Default        | Extra          |
 +--------------------------+------------------------------------+------+-----+----------------+----------------+
 | connection_group_id      | int(11)                            | NO   | PRI | NULL           | auto_increment |
 | parent_id                | int(11)                            | YES  | MUL | NULL           |                |
 | connection_group_name    | varchar(128)                       | NO   | MUL | NULL           |                |
 | type                     | enum('ORGANIZATIONAL','BALANCING') | NO   |     | ORGANIZATIONAL |                |
 | max_connections          | int(11)                            | YES  |     | NULL           |                |
 | max_connections_per_user | int(11)                            | YES  |     | NULL           |                |
 | enable_session_affinity  | tinyint(1)                         | NO   |     | 0              |                |
 +--------------------------+------------------------------------+------+-----+----------------+----------------+
 */

 /* Insert toplevel description */
INSERT INTO guacamole_db.guacamole_connection_group VALUES\
  (1,NULL,'Toplevel','ORGANIZATIONAL',NULL,NULL,0),\
  (2,1,'Level01','ORGANIZATIONAL',NULL,NULL,0),\
  (3,2,'Level01_1','ORGANIZATIONAL',NULL,NULL,0),\
  (4,1,'Level02','ORGANIZATIONAL',NULL,NULL,0),\
  (5,4,'Level02_1','ORGANIZATIONAL',NULL,NULL,0);


  /* mysql> desc guacamole_connection;
  +--------------------------+--------------------+------+-----+---------+----------------+
  | Field                    | Type               | Null | Key | Default | Extra          |
  +--------------------------+--------------------+------+-----+---------+----------------+
  | connection_id            | int(11)            | NO   | PRI | NULL    | auto_increment |
  | connection_name          | varchar(128)       | NO   | MUL | NULL    |                |
  | parent_id                | int(11)            | YES  | MUL | NULL    |                |
  | protocol                 | varchar(32)        | NO   |     | NULL    |                |
  | proxy_port               | int(11)            | YES  |     | NULL    |                |
  | proxy_hostname           | varchar(512)       | YES  |     | NULL    |                |
  | proxy_encryption_method  | enum('NONE','SSL') | YES  |     | NULL    |                |
  | max_connections          | int(11)            | YES  |     | NULL    |                |
  | max_connections_per_user | int(11)            | YES  |     | NULL    |                |
  | connection_weight        | int(11)            | YES  |     | NULL    |                |
  | failover_only            | tinyint(1)         | NO   |     | 0       |                |
  +--------------------------+--------------------+------+-----+---------+----------------+
  */

/* insert node inside service structure */
INSERT INTO guacamole_db.guacamole_connection VALUES (1,'Level01_Connection01',\
  1,'ssh',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO guacamole_db.guacamole_connection VALUES (2,'Level01_1_Connection01'\
  ,3,'ssh',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO guacamole_db.guacamole_connection VALUES (3,'Level01_1_Connection02'\
  ,3,'ssh',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO guacamole_db.guacamole_connection VALUES (4,'Level02_1_Connection01'\
  ,5,'ssh',NULL,NULL,NULL,NULL,NULL,NULL,0);
