DROP TABLE IF EXISTS WJ_CLASS_BASE;

DROP TABLE IF EXISTS WJ_CLASS_SCORE;

DROP TABLE IF EXISTS WJ_COURSE_BASE;

DROP TABLE IF EXISTS WJ_SCORE_BASE;

DROP TABLE IF EXISTS WJ_STUDENT_BASE;

DROP TABLE IF EXISTS WJ_TEACHER_BASE;

/*==============================================================*/
/* Table: WJ_CLASS_BASE                                         */
/*==============================================================*/
CREATE TABLE WJ_CLASS_BASE
(
   ID                   INT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
   ACADEMIC_YEAR        VARCHAR(16) COMMENT '教学学年',
   SEMESTER             VARCHAR(4) COMMENT '教学学期',
   CLASS_NAME           VARCHAR(32) COMMENT '班级名称',
   CLASS_ID             VARCHAR(10) COMMENT '班级编号',
   CLASS_ADVISER        VARCHAR(10) COMMENT '班级班主任',
   PRIMARY KEY (ID)
);

ALTER TABLE WJ_CLASS_BASE COMMENT '班级基本信息表';

/*==============================================================*/
/* Table: WJ_CLASS_SCORE                                        */
/*==============================================================*/
CREATE TABLE WJ_CLASS_SCORE
(
   CLASS_ID             INT COMMENT '主键ID',
   SCORE_ID             INT COMMENT '主键ID'
);

ALTER TABLE WJ_CLASS_SCORE COMMENT '班级-成绩';

/*==============================================================*/
/* Table: WJ_COURSE_BASE                                        */
/*==============================================================*/
CREATE TABLE WJ_COURSE_BASE
(
   ID                   INT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
   COURSE_NAME          VARCHAR(32) COMMENT '课程名称',
   COURSE_ID            VARCHAR(10) COMMENT '课程编号',
   COURSE_TEACHER       VARCHAR(10) COMMENT '课程授课教师',
   PRIMARY KEY (ID)
);

ALTER TABLE WJ_COURSE_BASE COMMENT '课程基本信息表';

/*==============================================================*/
/* Table: WJ_SCORE_BASE                                         */
/*==============================================================*/
CREATE TABLE WJ_SCORE_BASE
(
   ID                   INT NOT NULL COMMENT '主键ID',
   COURSE_SCORE         DECIMAL(4,1) COMMENT '学科成绩',
   ACADEMIC_YEAR        VARCHAR(16) COMMENT '教学学年',
   SEMESTER             VARCHAR(4) COMMENT '教学学期',
   COURSE_TEACHER       VARCHAR(10) COMMENT '课程授课教师',
   COURSE_ID            VARCHAR(10) COMMENT '课程编号',
   PRIMARY KEY (ID)
);

ALTER TABLE WJ_SCORE_BASE COMMENT '学生成绩信息表';

/*==============================================================*/
/* Table: WJ_STUDENT_BASE                                       */
/*==============================================================*/
CREATE TABLE WJ_STUDENT_BASE
(
   ID                   INT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
   BIRTHDAY             DATE COMMENT '出生日期',
   NAME                 VARCHAR(8) COMMENT '姓名',
   STUDENT_ID           VARCHAR(10) COMMENT '学生学号',
   GENDER               CHAR(1) COMMENT '性别',
   PRIMARY KEY (ID)
);

ALTER TABLE WJ_STUDENT_BASE COMMENT '学生基本信息表';

/*==============================================================*/
/* Table: WJ_TEACHER_BASE                                       */
/*==============================================================*/
CREATE TABLE WJ_TEACHER_BASE
(
   ID                   INT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
   NAME                 VARCHAR(8) COMMENT '姓名',
   TEACHER_ID           VARCHAR(10) COMMENT '教师编号',
   TEACHER_TITLE        VARCHAR(10) COMMENT '教师职称',
   GENDER               CHAR(1) COMMENT '性别',
   BIRTHDAY             DATE COMMENT '出生日期',
   PRIMARY KEY (ID)
);

ALTER TABLE WJ_TEACHER_BASE COMMENT '教师基本信息表';

ALTER TABLE WJ_CLASS_SCORE ADD CONSTRAINT FK_CLASS_SCORE FOREIGN KEY (CLASS_ID)
      REFERENCES WJ_CLASS_BASE (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE WJ_CLASS_SCORE ADD CONSTRAINT FK_CLASS_SCORE2 FOREIGN KEY (SCORE_ID)
      REFERENCES WJ_SCORE_BASE (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE WJ_SCORE_BASE ADD CONSTRAINT FK_STUDENT_SCORE FOREIGN KEY (ID)
      REFERENCES WJ_STUDENT_BASE (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;
