/**
 * @Author: Christian Langer <icedtux>
 * @Date:   2018-11-25T16:37:01+01:00
 * @Filename: 03_02_create_user_connection.sql
 * @Last modified by:   icedtux
 * @Last modified time: 2018-11-25T17:07:10+01:00
 */
 /* mysql> desc guacamole_connection_parameter;
 +-----------------+---------------+------+-----+---------+-------+
 | Field           | Type          | Null | Key | Default | Extra |
 +-----------------+---------------+------+-----+---------+-------+
 | connection_id   | int(11)       | NO   | PRI | NULL    |       |
 | parameter_name  | varchar(128)  | NO   | PRI | NULL    |       |
 | parameter_value | varchar(4096) | NO   |     | NULL    |       |
 +-----------------+---------------+------+-----+---------+-------+
 */

 /*
 Insert user specific connection parameter.
 Do this for all required connections, eg 1-4 (Level0*_*_Connection*)
 */

 INSERT INTO guacamole_db.guacamole_connection_parameter VALUES \
 (1,'color-scheme','black-white'),(1,'enable-sftp','true'),\
 (1,'font-size','10'),(1,'hostname','DNS_or_IP_1'),\
 (1,'password','PASSWORD'),\
 (1,'port','22'),\
 (1,'username','username'),\
 (1,'private-key','INSERT_SSH_PRIV_KEY');

 INSERT INTO guacamole_db.guacamole_connection_parameter VALUES \
 (2,'color-scheme','black-white'),(2,'enable-sftp','true'),\
 (2,'font-size','10'),(2,'hostname','DNS_or_IP_2'),\
 (2,'password','PASSWORD'),\
 (2,'port','22'),\
 (2,'username','username'),\
 (2,'private-key','INSERT_SSH_PRIV_KEY');

 INSERT INTO guacamole_db.guacamole_connection_parameter VALUES \
 (3,'color-scheme','black-white'),(3,'enable-sftp','true'),\
 (3,'font-size','10'),(3,'hostname','DNS_or_IP_3'),\
 (3,'password','PASSWORD'),\
 (3,'port','22'),\
 (3,'username','username'),\
 (3,'private-key','INSERT_SSH_PRIV_KEY');

 INSERT INTO guacamole_db.guacamole_connection_parameter VALUES \
 (4,'color-scheme','black-white'),(4,'enable-sftp','true'),\
 (4,'font-size','10'),(4,'hostname','DNS_or_IP_4'),\
 (4,'password','PASSWORD'),\
 (4,'port','22'),\
 (4,'username','username'),\
 (4,'private-key','INSERT_SSH_PRIV_KEY');

/* desc guacamole_connection_group_permission;
 +---------------------+---------------------------------------------+------+-----+---------+-------+
 | Field               | Type                                        | Null | Key | Default | Extra |
 +---------------------+---------------------------------------------+------+-----+---------+-------+
 | user_id             | int(11)                                     | NO   | PRI | NULL    |       |
 | connection_group_id | int(11)                                     | NO   | PRI | NULL    |       |
 | permission          | enum('READ','UPDATE','DELETE','ADMINISTER') | NO   | PRI | NULL    |       |
 +---------------------+---------------------------------------------+------+-----+---------+-------+
*/

/*
For every Level* (in this example there are 5 groups incl. Toplevel) there has
to be the READ right
*/
INSERT INTO guacamole_db.guacamole_connection_group_permission VALUES \
(2, 1, 'READ'),\
(2, 2, 'READ'),\
(2, 3, 'READ'),\
(2, 4, 'READ'),\
(2, 5, 'READ');

/* desc guacamole_connection_permission;
+---------------+---------------------------------------------+------+-----+---------+-------+
| Field         | Type                                        | Null | Key | Default | Extra |
+---------------+---------------------------------------------+------+-----+---------+-------+
| user_id       | int(11)                                     | NO   | PRI | NULL    |       |
| connection_id | int(11)                                     | NO   | PRI | NULL    |       |
| permission    | enum('READ','UPDATE','DELETE','ADMINISTER') | NO   | PRI | NULL    |       |
+---------------+---------------------------------------------+------+-----+---------+-------+
*/

/*
For every connection (in this example 4) there has to be the READ right.
*/
INSERT INTO guacamole_db.guacamole_connection_permission VALUES \
(2, 1, 'READ'),\
(2, 2, 'READ'),\
(2, 3, 'READ'),\
(2, 4, 'READ');
