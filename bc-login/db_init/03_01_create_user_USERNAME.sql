/**
 * @Author: Christian Langer <icedtux>
 * @Date:   2018-11-25T16:29:51+01:00
 * @Filename: 03_create_user_USERNAME.sql
 * @Last modified by:   icedtux
 * @Last modified time: 2018-11-25T16:59:00+01:00
 */
 /* insert new user */
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
Create user and hash password with salt.
UserID 1 is taken by guacadmin
*/
INSERT INTO guacamole_user (user_id, username, password_salt, password_hash,\
                            password_date, expired, timezone, full_name,\
                            email_address, organization, organizational_role)\
                    VALUES (2, 'username', @salt,\
                      UNHEX(SHA2(CONCAT('PASSWORD', HEX(@salt)), 256)), NOW(),\
                      '1', 'Europe/Berlin', 'FULL_USERNAME',\
                      'USEREMAIL', 'Orga', 'Role');
