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
   APP_ID               BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Ӧ������ID',
   APP_NAME             VARCHAR(64) NOT NULL COMMENT 'Ӧ������',
   APP_KEY              VARCHAR(64) NOT NULL COMMENT 'Ӧ��Key',
   APP_SECRET           VARCHAR(128) COMMENT 'Ӧ����Կ',
   DESCRIPTION          VARCHAR(256) NOT NULL COMMENT 'Ӧ������',
   CREATE_TIME          TIMESTAMP COMMENT '����ʱ��',
   LATEST_TIME          TIMESTAMP COMMENT '����޸�ʱ��',
   DATA_STATUS          SMALLINT COMMENT '����״̬',
   PRIMARY KEY (APP_ID)
)
TYPE = INNODB;

ALTER TABLE RBAC_APP COMMENT 'Ӧ����Ϣ��';

/*==============================================================*/
/* Table: RBAC_APP_ROLE                                         */
/*==============================================================*/
CREATE TABLE RBAC_APP_ROLE
(
   APP_ID               BIGINT NOT NULL COMMENT 'Ӧ������ID',
   ROLE_ID              BIGINT NOT NULL COMMENT '��ɫ����',
   PRIMARY KEY (APP_ID, ROLE_ID)
)
TYPE = INNODB;

ALTER TABLE RBAC_APP_ROLE COMMENT 'Ӧ��-��ɫ������';

/*==============================================================*/
/* Table: RBAC_PERMISSION                                       */
/*==============================================================*/
CREATE TABLE RBAC_PERMISSION
(
   PERM_ID              BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
   ROLE_ID              BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '��ɫ����',
   RES_ID               BIGINT COMMENT '��Դ����ID',
   RES_NAME             VARCHAR(64) NOT NULL COMMENT '��Դ����',
   RES_TYPE             SMALLINT NOT NULL COMMENT '��Դ����[APP(1) | MENU(2) | BUTTON(3)]',
   LINK_URL             VARCHAR(256) NOT NULL COMMENT '��Դ����',
   APP_ID               BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Ӧ������ID',
   CREATE_TIME          TIMESTAMP COMMENT '����ʱ��',
   LATEST_TIME          TIMESTAMP COMMENT '����޸�ʱ��',
   DATA_STATUS          SMALLINT COMMENT '����״̬',
   PRIMARY KEY (PERM_ID)
)
TYPE = INNODB;

ALTER TABLE RBAC_PERMISSION COMMENT '��ɫ-��ԴȨ�ޱ�';

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
   RES_ID               BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '��Դ����ID',
   APP_ID               BIGINT COMMENT 'Ӧ������ID',
   APP_NAME             VARCHAR(64) NOT NULL COMMENT 'Ӧ������',
   RES_NAME             VARCHAR(64) NOT NULL COMMENT '��Դ����',
   RES_TYPE             SMALLINT NOT NULL COMMENT '��Դ����[APP(1) | MENU(2) | BUTTON(3)]',
   LINK_URL             VARCHAR(256) COMMENT '��Դ����',
   PARENT_ID            BIGINT COMMENT '����Դ�ڵ�.',
   DESCRIPTION          VARCHAR(128) COMMENT '��Դ����',
   CREATE_TIME          TIMESTAMP COMMENT '����ʱ��',
   LATEST_TIME          TIMESTAMP COMMENT '����޸�ʱ��',
   DATA_STATUS          SMALLINT COMMENT '����״̬',
   PRIMARY KEY (RES_ID)
)
TYPE = INNODB;

ALTER TABLE RBAC_RESOURCE COMMENT '��Դ��Ϣ��';

/*==============================================================*/
/* Table: RBAC_ROLE                                             */
/*==============================================================*/
CREATE TABLE RBAC_ROLE
(
   ROLE_ID              BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '��ɫ����',
   ROLE_NAME            VARCHAR(64) NOT NULL COMMENT '��ɫ����',
   ROLE_DESC            VARCHAR(256) COMMENT '��ɫ����',
   CREATE_TIME          TIMESTAMP COMMENT '����ʱ��',
   LATEST_TIME          TIMESTAMP COMMENT '����޸�ʱ��',
   DATA_STATUS          SMALLINT COMMENT '����״̬',
   PRIMARY KEY (ROLE_ID)
)
TYPE = INNODB;

ALTER TABLE RBAC_ROLE COMMENT '��ɫ��Ϣ��';

/*==============================================================*/
/* Table: RBAC_USER                                             */
/*==============================================================*/
CREATE TABLE RBAC_USER
(
   USER_ID              BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '�û�����',
   USER_NAME            VARCHAR(64) NOT NULL COMMENT '�û�����',
   USER_TYPE            VARCHAR(10) NOT NULL COMMENT '�û�����[ERP("1"), PASSPORT("3"), ECLP("2")]',
   REAL_NAME            VARCHAR(64) COMMENT '�ڲ�Ա������',
   SELLER_ID            BIGINT COMMENT '�����̼�ID',
   SELLER_NO            VARCHAR(64) COMMENT '�����̼ұ��',
   SELLER_NAME          VARCHAR(255) COMMENT '�����̼�����',
   DEPT_ID              BIGINT COMMENT '������ҵ��id',
   DEPT_NO              VARCHAR(20) COMMENT '������ҵ�����',
   ORG_ID               BIGINT COMMENT '������֯id',
   ORG_NO               VARCHAR(64) COMMENT '������֯���',
   YN                   SMALLINT COMMENT 'ɾ����־',
   DEPARTMENT           VARCHAR(255) COMMENT 'ҵ��
            ��������(��������)',
   ORGANIZATION         VARCHAR(255) COMMENT 'ҵ�񷽱�����(����)',
   SALT                 VARCHAR(128) COMMENT '�������salt',
   PASSWORD             VARCHAR(128) COMMENT '�û�����',
   CREATE_TIME          TIMESTAMP COMMENT '����ʱ��',
   DATA_STATUS          SMALLINT COMMENT '����״̬',
   LATEST_TIME          TIMESTAMP COMMENT '����޸�ʱ��',
   USER_STATUS          VARCHAR(64) NOT NULL COMMENT '�û�״̬: 0-ͣ��; 1-����',
   PRIMARY KEY (USER_ID)
)
TYPE = INNODB;

ALTER TABLE RBAC_USER COMMENT '�û���Ϣ��';

/*==============================================================*/
/* Table: RBAC_USER_ROLE                                        */
/*==============================================================*/
CREATE TABLE RBAC_USER_ROLE
(
   ROLE_ID              BIGINT NOT NULL COMMENT '��ɫ����',
   USER_ID              BIGINT NOT NULL COMMENT '�û�����',
   PRIMARY KEY (ROLE_ID, USER_ID)
)
TYPE = INNODB;

ALTER TABLE RBAC_USER_ROLE COMMENT '�û�-��ɫ������';

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
