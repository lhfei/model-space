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
   ID                   INT NOT NULL AUTO_INCREMENT COMMENT '����ID',
   ACADEMIC_YEAR        VARCHAR(16) COMMENT '��ѧѧ��',
   SEMESTER             VARCHAR(4) COMMENT '��ѧѧ��',
   CLASS_NAME           VARCHAR(32) COMMENT '�༶����',
   CLASS_ID             VARCHAR(10) COMMENT '�༶���',
   CLASS_ADVISER        VARCHAR(10) COMMENT '�༶������',
   PRIMARY KEY (ID)
);

ALTER TABLE WJ_CLASS_BASE COMMENT '�༶������Ϣ��';

/*==============================================================*/
/* Table: WJ_CLASS_SCORE                                        */
/*==============================================================*/
CREATE TABLE WJ_CLASS_SCORE
(
   CLASS_ID             INT COMMENT '����ID',
   SCORE_ID             INT COMMENT '����ID'
);

ALTER TABLE WJ_CLASS_SCORE COMMENT '�༶-�ɼ�';

/*==============================================================*/
/* Table: WJ_COURSE_BASE                                        */
/*==============================================================*/
CREATE TABLE WJ_COURSE_BASE
(
   ID                   INT NOT NULL AUTO_INCREMENT COMMENT '����ID',
   COURSE_NAME          VARCHAR(32) COMMENT '�γ�����',
   COURSE_ID            VARCHAR(10) COMMENT '�γ̱��',
   COURSE_TEACHER       VARCHAR(10) COMMENT '�γ��ڿν�ʦ',
   PRIMARY KEY (ID)
);

ALTER TABLE WJ_COURSE_BASE COMMENT '�γ̻�����Ϣ��';

/*==============================================================*/
/* Table: WJ_SCORE_BASE                                         */
/*==============================================================*/
CREATE TABLE WJ_SCORE_BASE
(
   ID                   INT NOT NULL COMMENT '����ID',
   COURSE_SCORE         DECIMAL(4,1) COMMENT 'ѧ�Ƴɼ�',
   ACADEMIC_YEAR        VARCHAR(16) COMMENT '��ѧѧ��',
   SEMESTER             VARCHAR(4) COMMENT '��ѧѧ��',
   COURSE_TEACHER       VARCHAR(10) COMMENT '�γ��ڿν�ʦ',
   COURSE_ID            VARCHAR(10) COMMENT '�γ̱��',
   PRIMARY KEY (ID)
);

ALTER TABLE WJ_SCORE_BASE COMMENT 'ѧ���ɼ���Ϣ��';

/*==============================================================*/
/* Table: WJ_STUDENT_BASE                                       */
/*==============================================================*/
CREATE TABLE WJ_STUDENT_BASE
(
   ID                   INT NOT NULL AUTO_INCREMENT COMMENT '����ID',
   BIRTHDAY             DATE COMMENT '��������',
   NAME                 VARCHAR(8) COMMENT '����',
   STUDENT_ID           VARCHAR(10) COMMENT 'ѧ��ѧ��',
   GENDER               CHAR(1) COMMENT '�Ա�',
   PRIMARY KEY (ID)
);

ALTER TABLE WJ_STUDENT_BASE COMMENT 'ѧ��������Ϣ��';

/*==============================================================*/
/* Table: WJ_TEACHER_BASE                                       */
/*==============================================================*/
CREATE TABLE WJ_TEACHER_BASE
(
   ID                   INT NOT NULL AUTO_INCREMENT COMMENT '����ID',
   NAME                 VARCHAR(8) COMMENT '����',
   TEACHER_ID           VARCHAR(10) COMMENT '��ʦ���',
   TEACHER_TITLE        VARCHAR(10) COMMENT '��ʦְ��',
   GENDER               CHAR(1) COMMENT '�Ա�',
   BIRTHDAY             DATE COMMENT '��������',
   PRIMARY KEY (ID)
);

ALTER TABLE WJ_TEACHER_BASE COMMENT '��ʦ������Ϣ��';

ALTER TABLE WJ_CLASS_SCORE ADD CONSTRAINT FK_CLASS_SCORE FOREIGN KEY (CLASS_ID)
      REFERENCES WJ_CLASS_BASE (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE WJ_CLASS_SCORE ADD CONSTRAINT FK_CLASS_SCORE2 FOREIGN KEY (SCORE_ID)
      REFERENCES WJ_SCORE_BASE (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE WJ_SCORE_BASE ADD CONSTRAINT FK_STUDENT_SCORE FOREIGN KEY (ID)
      REFERENCES WJ_STUDENT_BASE (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;
