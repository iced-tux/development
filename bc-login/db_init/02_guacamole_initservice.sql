/* insert service grouping */

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
 (1,NULL,'root','ORGANIZATIONAL',NULL,NULL,0),\
 (2,1,'firstlevel01','ORGANIZATIONAL',NULL,NULL,0),\
 (3,2,'secondlevel01','ORGANIZATIONAL',NULL,NULL,0),\
 (4,1,'firstlevel02','ORGANIZATIONAL',NULL,NULL,0),\
 (5,4,'secondlevel02','ORGANIZATIONAL',NULL,NULL,0),\
 (6,1,'firstlevel03','ORGANIZATIONAL',NULL,NULL,0),\
 (7,6,'secondlevel03','ORGANIZATIONAL',NULL,NULL,0),\
 (8,1,'firstlevel04','ORGANIZATIONAL',NULL,NULL,0),\
 (9,1,'firstlevel05','ORGANIZATIONAL',NULL,NULL,0); */

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
INSERT INTO guacamole_db.guacamole_connection VALUES (1,'node_name',9,'ssh',NULL,NULL,NULL,NULL,NULL,NULL,0);

/* mysql> desc guacamole_connection_parameter;
+-----------------+---------------+------+-----+---------+-------+
| Field           | Type          | Null | Key | Default | Extra |
+-----------------+---------------+------+-----+---------+-------+
| connection_id   | int(11)       | NO   | PRI | NULL    |       |
| parameter_name  | varchar(128)  | NO   | PRI | NULL    |       |
| parameter_value | varchar(4096) | NO   |     | NULL    |       |
+-----------------+---------------+------+-----+---------+-------+
*/
INSERT INTO guacamole_db.guacamole_connection_parameter VALUES \
(1,'color-scheme','black-white'),(1,'enable-sftp','true'),\
(1,'font-size','10'),(1,'hostname','<remotehostip>'),\
(1,'password','testpassword'),\
(1,'port','22'),\
(1,'username','testuser'),\
(1,'private-key','<insertprivatekeyherewith\ntoremovelinebreaks>');
