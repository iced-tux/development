/**
 * @Author: Christian Langer <icedtux>
 * @Date:   2018-11-25T17:01:29+01:00
 * @Filename: 01_reset_guacadmin.sql
 * @Last modified by:   icedtux
 * @Last modified time: 2018-11-25T17:08:14+01:00
 */
 /* desc guacamole_user;
 +---------------------+--------------+------+-----+---------+----------------+
 | Field               | Type         | Null | Key | Default | Extra          |
 +---------------------+--------------+------+-----+---------+----------------+
 | user_id             | int(11)      | NO   | PRI | NULL    | auto_increment |
 | username            | varchar(128) | NO   | UNI | NULL    |                |
 | password_hash       | binary(32)   | NO   |     | NULL    |                |
 | password_salt       | binary(32)   | YES  |     | NULL    |                |
 | password_date       | datetime     | NO   |     | NULL    |                |
 | disabled            | tinyint(1)   | NO   |     | 0       |                |
 | expired             | tinyint(1)   | NO   |     | 0       |                |
 | access_window_start | time         | YES  |     | NULL    |                |
 | access_window_end   | time         | YES  |     | NULL    |                |
 | valid_from          | date         | YES  |     | NULL    |                |
 | valid_until         | date         | YES  |     | NULL    |                |
 | timezone            | varchar(64)  | YES  |     | NULL    |                |
 | full_name           | varchar(256) | YES  |     | NULL    |                |
 | email_address       | varchar(256) | YES  |     | NULL    |                |
 | organization        | varchar(256) | YES  |     | NULL    |                |
 | organizational_role | varchar(256) | YES  |     | NULL    |                |
 +---------------------+--------------+------+-----+---------+----------------+
 */
 -- Generate salt
 SET @salt = UNHEX(SHA2(UUID(), 256));

 /*
 Change guacadmin passwort and force change
 */
 UPDATE guacamole_user SET password_salt = @salt,\
  password_hash = UNHEX(SHA2(CONCAT('PASSWORD', HEX(@salt)), 256)),\
  password_date = NOW(),\
  expired = 1
 WHERE
 user_id = 1;
