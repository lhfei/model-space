DROP TABLE IF EXISTS RBAC_APP;

DROP TABLE IF EXISTS RBAC_APP_ROLE;

DROP INDEX PERM_ID ON RBAC_PERMISSION;

DROP TABLE IF EXISTS RBAC_PERMISSION;

DROP TABLE IF EXISTS RBAC_RESOURCE;

DROP TABLE IF EXISTS RBAC_ROLE;

DROP TABLE IF EXISTS RBAC_USER;

DROP TABLE IF EXISTS RBAC_USER_ROLE;

/*==============================================================*/
/* Table: RBAC_APP                                              */
/*==============================================================*/
CREATE TABLE RBAC_APP
(
   APP_ID               BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '应用主键ID',
   APP_NAME             VARCHAR(64) NOT NULL COMMENT '应用名称',
   APP_KEY              VARCHAR(64) NOT NULL COMMENT '应用Key',
   APP_SECRET           VARCHAR(128) COMMENT '应用秘钥',
   DESCRIPTION          VARCHAR(256) NOT NULL COMMENT '应用描述',
   CREATE_TIME          TIMESTAMP COMMENT '创建时间',
   LATEST_TIME          TIMESTAMP COMMENT '最近修改时间',
   DATA_STATUS          SMALLINT COMMENT '数据状态',
   PRIMARY KEY (APP_ID)
)
TYPE = INNODB;

ALTER TABLE RBAC_APP COMMENT '应用信息表';

/*==============================================================*/
/* Table: RBAC_APP_ROLE                                         */
/*==============================================================*/
CREATE TABLE RBAC_APP_ROLE
(
   APP_ID               BIGINT NOT NULL COMMENT '应用主键ID',
   ROLE_ID              BIGINT NOT NULL COMMENT '角色主键',
   PRIMARY KEY (APP_ID, ROLE_ID)
)
TYPE = INNODB;

ALTER TABLE RBAC_APP_ROLE COMMENT '应用-角色关联表';

/*==============================================================*/
/* Table: RBAC_PERMISSION                                       */
/*==============================================================*/
CREATE TABLE RBAC_PERMISSION
(
   PERM_ID              BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
   ROLE_ID              BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色主键',
   RES_ID               BIGINT COMMENT '资源主键ID',
   RES_NAME             VARCHAR(64) NOT NULL COMMENT '资源名称',
   RES_TYPE             SMALLINT NOT NULL COMMENT '资源类型[APP(1) | MENU(2) | BUTTON(3)]',
   LINK_URL             VARCHAR(256) NOT NULL COMMENT '资源链接',
   APP_ID               BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '应用主键ID',
   CREATE_TIME          TIMESTAMP COMMENT '创建时间',
   LATEST_TIME          TIMESTAMP COMMENT '最近修改时间',
   DATA_STATUS          SMALLINT COMMENT '数据状态',
   PRIMARY KEY (PERM_ID)
)
TYPE = INNODB;

ALTER TABLE RBAC_PERMISSION COMMENT '角色-资源权限表';

/*==============================================================*/
/* Index: PERM_ID                                               */
/*==============================================================*/
CREATE INDEX PERM_ID ON RBAC_PERMISSION
(
   
);

/*==============================================================*/
/* Table: RBAC_RESOURCE                                         */
/*==============================================================*/
CREATE TABLE RBAC_RESOURCE
(
   RES_ID               BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '资源主键ID',
   APP_ID               BIGINT COMMENT '应用主键ID',
   APP_NAME             VARCHAR(64) NOT NULL COMMENT '应用名称',
   RES_NAME             VARCHAR(64) NOT NULL COMMENT '资源名称',
   RES_TYPE             SMALLINT NOT NULL COMMENT '资源类型[APP(1) | MENU(2) | BUTTON(3)]',
   LINK_URL             VARCHAR(256) COMMENT '资源链接',
   PARENT_ID            BIGINT COMMENT '父资源节点.',
   DESCRIPTION          VARCHAR(128) COMMENT '资源描述',
   CREATE_TIME          TIMESTAMP COMMENT '创建时间',
   LATEST_TIME          TIMESTAMP COMMENT '最近修改时间',
   DATA_STATUS          SMALLINT COMMENT '数据状态',
   PRIMARY KEY (RES_ID)
)
TYPE = INNODB;

ALTER TABLE RBAC_RESOURCE COMMENT '资源信息表';

/*==============================================================*/
/* Table: RBAC_ROLE                                             */
/*==============================================================*/
CREATE TABLE RBAC_ROLE
(
   ROLE_ID              BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色主键',
   ROLE_NAME            VARCHAR(64) NOT NULL COMMENT '角色名称',
   ROLE_DESC            VARCHAR(256) COMMENT '角色描述',
   CREATE_TIME          TIMESTAMP COMMENT '创建时间',
   LATEST_TIME          TIMESTAMP COMMENT '最近修改时间',
   DATA_STATUS          SMALLINT COMMENT '数据状态',
   PRIMARY KEY (ROLE_ID)
)
TYPE = INNODB;

ALTER TABLE RBAC_ROLE COMMENT '角色信息表';

/*==============================================================*/
/* Table: RBAC_USER                                             */
/*==============================================================*/
CREATE TABLE RBAC_USER
(
   USER_ID              BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户主键',
   USER_NAME            VARCHAR(64) NOT NULL COMMENT '用户姓名',
   USER_TYPE            VARCHAR(10) NOT NULL COMMENT '用户类型[ERP("1"), PASSPORT("3"), ECLP("2")]',
   REAL_NAME            VARCHAR(64) COMMENT '内部员工姓名',
   SELLER_ID            BIGINT COMMENT '所属商家ID',
   SELLER_NO            VARCHAR(64) COMMENT '所属商家编号',
   SELLER_NAME          VARCHAR(255) COMMENT '所属商家名称',
   DEPT_ID              BIGINT COMMENT '所属事业部id',
   DEPT_NO              VARCHAR(20) COMMENT '所属事业部编号',
   ORG_ID               BIGINT COMMENT '所属组织id',
   ORG_NO               VARCHAR(64) COMMENT '所属组织编号',
   YN                   SMALLINT COMMENT '删除标志',
   DEPARTMENT           VARCHAR(255) COMMENT '业务
            方必填项(所属部门)',
   ORGANIZATION         VARCHAR(255) COMMENT '业务方必填项(机构)',
   SALT                 VARCHAR(128) COMMENT '密码加密salt',
   PASSWORD             VARCHAR(128) COMMENT '用户密码',
   CREATE_TIME          TIMESTAMP COMMENT '创建时间',
   DATA_STATUS          SMALLINT COMMENT '数据状态',
   LATEST_TIME          TIMESTAMP COMMENT '最近修改时间',
   USER_STATUS          VARCHAR(64) NOT NULL COMMENT '用户状态: 0-停用; 1-启用',
   PRIMARY KEY (USER_ID)
)
TYPE = INNODB;

ALTER TABLE RBAC_USER COMMENT '用户信息表';

/*==============================================================*/
/* Table: RBAC_USER_ROLE                                        */
/*==============================================================*/
CREATE TABLE RBAC_USER_ROLE
(
   ROLE_ID              BIGINT NOT NULL COMMENT '角色主键',
   USER_ID              BIGINT NOT NULL COMMENT '用户主键',
   PRIMARY KEY (ROLE_ID, USER_ID)
)
TYPE = INNODB;

ALTER TABLE RBAC_USER_ROLE COMMENT '用户-角色关联表';

ALTER TABLE RBAC_APP_ROLE ADD CONSTRAINT FK_APP_ROLE FOREIGN KEY (APP_ID)
      REFERENCES RBAC_APP (APP_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE RBAC_APP_ROLE ADD CONSTRAINT FK_APP_ROLE2 FOREIGN KEY (ROLE_ID)
      REFERENCES RBAC_ROLE (ROLE_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE RBAC_PERMISSION ADD CONSTRAINT FK_ROLE_ID FOREIGN KEY ()
      REFERENCES RBAC_ROLE (ROLE_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE RBAC_RESOURCE ADD CONSTRAINT FK_APP_RESOURCE FOREIGN KEY (APP_ID)
      REFERENCES RBAC_APP (APP_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE RBAC_USER_ROLE ADD CONSTRAINT FK_USER_ROLE FOREIGN KEY ()
      REFERENCES RBAC_ROLE (ROLE_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE RBAC_USER_ROLE ADD CONSTRAINT FK_USER_ROLE2 FOREIGN KEY (USER_ID)
      REFERENCES RBAC_USER (USER_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;
