DROP TABLE IF EXISTS AI_DATA_FILE;

DROP TABLE IF EXISTS AI_JOB;

DROP TABLE IF EXISTS AI_MODEL;

DROP TABLE IF EXISTS AI_MODEL_VERSION;

DROP TABLE IF EXISTS AI_TASK;

DROP TABLE IF EXISTS AI_TASK_DATA;

/*==============================================================*/
/* Table: AI_DATA_FILE                                          */
/*==============================================================*/
CREATE TABLE AI_DATA_FILE
(
   DATA_ID              BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '数据主键ID',
   FILE_NAME            VARCHAR(128) NOT NULL COMMENT '文件存储名称',
   USER_ID              VARCHAR(32) COMMENT '所属用户ID',
   FILE_CONFIG          TEXT COMMENT '数据规格说明',
   FILE_DIR             VARCHAR(256) COMMENT '文件存储路径',
   USE_TYPE             SMALLINT NOT NULL DEFAULT 0 COMMENT '用它类型[ 历史数据(0) | 预测数据(1)]',
   FILE_SIZE            VARCHAR(32) COMMENT '文件大小',
   ORIGIN_NAME          VARCHAR(64) NOT NULL COMMENT '用户上传附件原始名称',
   LATEST_DATE          DATETIME COMMENT '最后一次操作日期',
   CREATE_DATE          DATETIME COMMENT '创建日期',
   OPERATOR             VARCHAR(32) COMMENT '操作人',
   DATA_STATUS          SMALLINT DEFAULT 1 COMMENT '数据状态[有效(1)|禁用(0)|已删除(-1)]',
   PRIMARY KEY (DATA_ID)
);

ALTER TABLE AI_DATA_FILE COMMENT '上传文件记录表';

/*==============================================================*/
/* Table: AI_JOB                                                */
/*==============================================================*/
CREATE TABLE AI_JOB
(
   JOB_ID               BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Job主键ID',
   TASK_ID              BIGINT NOT NULL COMMENT '任务主键ID',
   JOB_NAME             VARCHAR(64) NOT NULL COMMENT 'Job名称',
   PARAMS               TEXT COMMENT 'Job 参数',
   JOB_STATUS           SMALLINT NOT NULL COMMENT 'Job 状态',
   JOB_DATA             TEXT COMMENT 'Job 结果',
   LATEST_DATE          DATETIME COMMENT '最后一次操作日期',
   CREATE_DATE          DATETIME COMMENT '创建日期',
   OPERATOR             VARCHAR(32) COMMENT '操作人',
   DATA_STATUS          SMALLINT DEFAULT 1 COMMENT '数据状态[有效(1)|禁用(0)|已删除(-1)]',
   PRIMARY KEY (JOB_ID)
);

ALTER TABLE AI_JOB COMMENT 'Job 记录管理表.';

/*==============================================================*/
/* Table: AI_MODEL                                              */
/*==============================================================*/
CREATE TABLE AI_MODEL
(
   MODEL_ID             BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '模型主键ID',
   MODEL_NAME           VARCHAR(64) NOT NULL COMMENT '模型名称',
   MODEL_DESC           TEXT COMMENT '模型说明',
   MODEL_PARAMS         TEXT COMMENT '模型参数说明',
   LATEST_DATE          DATETIME COMMENT '最后一次操作日期',
   CREATE_DATE          DATETIME COMMENT '创建日期',
   OPERATOR             VARCHAR(32) COMMENT '操作人',
   DATA_STATUS          SMALLINT DEFAULT 1 COMMENT '数据状态[有效(1)|禁用(0)|已删除(-1)]',
   PRIMARY KEY (MODEL_ID)
);

ALTER TABLE AI_MODEL COMMENT '算法模型记录表.';

/*==============================================================*/
/* Table: AI_MODEL_VERSION                                      */
/*==============================================================*/
CREATE TABLE AI_MODEL_VERSION
(
   VERSION_ID           BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '版本主键ID',
   MODEL_ID             BIGINT NOT NULL COMMENT '模型主键ID',
   MODEL_LANG           VARCHAR(8) NOT NULL COMMENT '模型语言',
   MODEL_SOURCE         TEXT COMMENT '模型源程序',
   MODEL_ALIAS          VARCHAR(8) NOT NULL COMMENT '模型语言别名',
   VERSION              VARCHAR(32) NOT NULL COMMENT '版本号',
   DESCRIPTION          VARCHAR(128) COMMENT '版本说明',
   LATEST_DATE          DATETIME COMMENT '最后一次操作日期',
   CREATE_DATE          DATETIME COMMENT '创建日期',
   OPERATOR             VARCHAR(32) COMMENT '操作人',
   DATA_STATUS          SMALLINT DEFAULT 1 COMMENT '数据状态[有效(1)|禁用(0)|已删除(-1)]',
   PRIMARY KEY (VERSION_ID)
);

ALTER TABLE AI_MODEL_VERSION COMMENT '模型版本配置说明.';

/*==============================================================*/
/* Table: AI_TASK                                               */
/*==============================================================*/
CREATE TABLE AI_TASK
(
   TASK_ID              BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '任务主键ID',
   MODEL_ID             BIGINT COMMENT '模型主键ID',
   TASK_NAME            VARCHAR(32) NOT NULL COMMENT '任务名称',
   USER_ID              VARCHAR(32) NOT NULL COMMENT '所属用户ID',
   FILE_CONFIG          TEXT COMMENT '数据规格说明',
   CURRENT_STEP         SMALLINT NOT NULL COMMENT '当前步骤',
   LATEST_DATE          DATETIME COMMENT '最后一次操作日期',
   CREATE_DATE          DATETIME COMMENT '创建日期',
   OPERATOR             VARCHAR(32) COMMENT '操作人',
   DATA_STATUS          SMALLINT DEFAULT 1 COMMENT '数据状态[有效(1)|禁用(0)|已删除(-1)]',
   PRIMARY KEY (TASK_ID)
);

ALTER TABLE AI_TASK COMMENT '任务记录表,记录用户操作步骤流程.';

/*==============================================================*/
/* Table: AI_TASK_DATA                                          */
/*==============================================================*/
CREATE TABLE AI_TASK_DATA
(
   TASK_ID              BIGINT NOT NULL COMMENT '任务主键ID',
   DATA_ID              BIGINT NOT NULL COMMENT '数据主键ID',
   PRIMARY KEY (TASK_ID, DATA_ID)
);

ALTER TABLE AI_TASK_DATA COMMENT '任务-数据关联';
