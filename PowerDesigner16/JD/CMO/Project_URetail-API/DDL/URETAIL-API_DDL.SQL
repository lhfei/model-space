/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/12/21 10:09:35                          */
/*==============================================================*/


DROP TABLE IF EXISTS AUDIT_LOG;

DROP TABLE IF EXISTS DATA_FILE;

DROP TABLE IF EXISTS PIN_FILE;

/*==============================================================*/
/* Table: AUDIT_LOG                                             */
/*==============================================================*/
CREATE TABLE AUDIT_LOG
(
   ID                   BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
   OPERATOR_ID          VARCHAR(64) NOT NULL COMMENT '操作人ID',
   DELEGATION           VARCHAR(8) NOT NULL COMMENT '操作方[九数(JS001000 ) | 中台(ZT001000 ) | 精准通(JZT00100)]',
   TASK_ID              VARCHAR(64) NOT NULL COMMENT '操作ID',
   OPS_TYPE             VARCHAR(16) NOT NULL COMMENT '操作类型',
   OPS_STATUS           VARCHAR(16) NOT NULL COMMENT '操作进展状态',
   CREATE_TIME          DATETIME NOT NULL COMMENT '创建日期',
   LATEST_TIME          DATETIME NOT NULL COMMENT '最近修改日期',
   DATA_STATUS          SMALLINT NOT NULL DEFAULT 0 COMMENT '数据状态[0 (有效) | -1 (删除)]',
   PRIMARY KEY (ID)
)
TYPE = INNODB
AUTO_INCREMENT = 1000;

ALTER TABLE AUDIT_LOG COMMENT '调用接口操作审计日志';

/*==============================================================*/
/* Table: DATA_FILE                                             */
/*==============================================================*/
CREATE TABLE DATA_FILE
(
   ID                   BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
   OPERATOR_ID          VARCHAR(64) NOT NULL COMMENT '操作人ID',
   FILE_NAME            VARCHAR(128) NOT NULL COMMENT '文件名称',
   EXT_ID               BIGINT COMMENT '文件外部ID',
   STORE_URL            VARCHAR(512) COMMENT '存储URL',
   STORAGE_TYPE         VARCHAR(8) COMMENT '存储类型[HDFS | JSS]',
   STORAGE_NAME         VARCHAR(32) COMMENT '存储介质名称',
   DELEGATION           VARCHAR(8) NOT NULL COMMENT '操作方[九数(JS001000 ) | 中台(ZT001000 ) | 精准通(JZT00100)]',
   TASK_ID              VARCHAR(64) NOT NULL COMMENT '操作ID',
   CREATE_TIME          DATETIME NOT NULL COMMENT '创建日期',
   LATEST_TIME          DATETIME NOT NULL COMMENT '最近修改日期',
   DATA_STATUS          SMALLINT NOT NULL DEFAULT 0 COMMENT '数据状态[0 (有效) | -1 (删除)]',
   PRIMARY KEY (ID)
)
TYPE = INNODB
AUTO_INCREMENT = 1000;

/*==============================================================*/
/* Table: PIN_FILE                                              */
/*==============================================================*/
CREATE TABLE PIN_FILE
(
   ID                   BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
   OPERATOR_ID          VARCHAR(64) NOT NULL COMMENT '操作人ID',
   FILE_NAME            VARCHAR(128) NOT NULL COMMENT '文件名称',
   VENDOR_ID            VARCHAR(128) COMMENT '广告投放主ID',
   EXT_ID               BIGINT COMMENT '文件外部ID',
   STORE_URL            VARCHAR(512) COMMENT '存储URL',
   STORAGE_TYPE         VARCHAR(8) COMMENT '存储类型[HDFS | JSS]',
   STORAGE_NAME         VARCHAR(32) COMMENT '存储介质名称',
   TOTAL_LINE           INT COMMENT '文件总行数',
   ORIGIN_NAME          VARCHAR(128) COMMENT '文件原始名称',
   DELEGATION           VARCHAR(8) NOT NULL COMMENT '操作方[九数(JS001000 ) | 中台(ZT001000 ) | 精准通(JZT00100)]',
   TASK_ID              VARCHAR(64) NOT NULL COMMENT '操作ID',
   CREATE_TIME          DATETIME NOT NULL COMMENT '创建日期',
   LATEST_TIME          DATETIME NOT NULL COMMENT '最近修改日期',
   DATA_STATUS          SMALLINT NOT NULL DEFAULT 0 COMMENT '数据状态[0 (有效) | -1 (删除)]',
   PRIMARY KEY (ID)
)
TYPE = INNODB
AUTO_INCREMENT = 1000;

ALTER TABLE PIN_FILE COMMENT 'Pin 包文件';

