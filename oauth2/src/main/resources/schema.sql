CREATE TABLE IF NOT EXISTS oauth_client_details(
    client_id VARCHAR (255) NOT NULL ,
    client_secret VARCHAR (255) NOT NULL ,
    web_server_redirect_uri VARCHAR (2048) DEFAULT NULL ,
    scope VARCHAR (255) DEFAULT NULL ,
    access_token_validity INT(11) DEFAULT NULL ,
    refresh_token_validity INT(11) DEFAULT NULL ,
    resource_ids VARCHAR (1024) DEFAULT NULL ,
    authorized_grant_types VARCHAR (1024) DEFAULT NULL ,
    authorities VARCHAR (1024) DEFAULT NULL ,
    additional_information VARCHAR (4096) DEFAULT NULL ,
    autoapprove VARCHAR (255) DEFAULT NULL,
    PRIMARY KEY (client_id)
) engine=innodb;

CREATE TABLE IF NOT EXISTS permission (
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(512) DEFAULT NULL ,
    PRIMARY KEY (id),
    UNIQUE KEY name (name)
) engine=innodb;

CREATE TABLE IF NOT EXISTS role(
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR (255) DEFAULT NULL ,
    PRIMARY KEY (id),
    UNIQUE KEY name (name)
) engine=innodb;

CREATE TABLE IF NOT EXISTS user (
    id INT(11) NOT NULL AUTO_INCREMENT,
    username VARCHAR (100) NOT NULL,
    password VARCHAR (1024) NOT NULL,
    email VARCHAR (1024) NOT NULL ,
    enabled TINYINT(4) NOT NULL,
    accountNonExpired TINYINT(4) NOT NULL,
    credentialsNonExpired TINYINT(4) NOT NULL,
    accountNonLocked TINYINT(4) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY username (username)
) engine=innodb;

CREATE TABLE IF NOT EXISTS permission_role(
    permission_id INT(11) DEFAULT NULL,
    role_id INT(11) DEFAULT NULL ,
    KEY permission_id (permission_id),
    KEY role_id (role_id),
    CONSTRAINT permission_role_ibfk_1 FOREIGN KEY (permission_id) REFERENCES permission(id),
    CONSTRAINT permission_role_ibfk_2 FOREIGN KEY (role_id) REFERENCES role(id)
)engine=innodb;

CREATE TABLE IF NOT EXISTS role_user(
    role_id INT(11) DEFAULT NULL,
    user_id INT(11) DEFAULT NULL,
    KEY role_id(role_id),
    KEY user_id(user_id),
    CONSTRAINT role_user_ibfk1 FOREIGN KEY (role_id) REFERENCES role(id),
    CONSTRAINT role_user_ibfk2 FOREIGN KEY (user_id) REFERENCES user(id)
)engine=innodb;

CREATE TABLE IF NOT EXISTS oauth_client_token(
    token_id VARCHAR(256),
    token LONG VARBINARY,
    authentication_id VARCHAR(256) PRIMARY KEY,
    user_name VARCHAR(256),
    client_id VARCHAR(256)
)engine=innodb;

CREATE TABLE IF NOT EXISTS oauth_access_token(
    token_id VARCHAR(256),
    token LONG VARBINARY,
    authentication_id  VARCHAR(256) PRIMARY KEY,
    user_name VARCHAR(256),
    client_id VARCHAR(256),
    authentication LONG VARBINARY,
    refresh_token VARCHAR (256)
)engine=innodb;

CREATE TABLE IF NOT EXISTS oauth_refresh_token(
    token_id VARCHAR(256),
    token LONG VARBINARY,
    authentication LONG VARBINARY
)engine=innodb;

CREATE TABLE IF NOT EXISTS oauth_code(
    code VARCHAR(256),
    authentication LONG VARBINARY
)engine=innodb;

CREATE TABLE IF NOT EXISTS oauth_approvals(
    userId VARCHAR(256),
    clientId VARCHAR(256),
    scope VARCHAR(256),
    status VARCHAR(10),
    expiresAt TIMESTAMP,
    lastModifiedAt TIMESTAMP
)engine=innodb;