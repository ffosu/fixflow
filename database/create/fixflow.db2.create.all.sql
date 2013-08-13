CREATE TABLE FIXFLOW_WORKDATE_WEEKNUM
(
  WEEK_NUM         VARCHAR(64) NOT NULL,
  AMPM             VARCHAR(64) NOT NULL,
  BEGINDATE        VARCHAR(64) NOT NULL,
  ENDDATE          VARCHAR(64) NOT NULL,
  ARCHIVE_TIME TIMESTAMP
)

;
ALTER TABLE FIXFLOW_WORKDATE_WEEKNUM ADD CONSTRAINT FIXFLOW_WORKDATE_WEEKNUM1 PRIMARY KEY (WEEK_NUM,AMPM)
;

CREATE TABLE FIXFLOW_AGENT_AGENTDETAILS (
  AGENT_ID VARCHAR(64) NOT NULL,
  PROCESS_ID VARCHAR(64) NOT NULL,
  PROCESS_NAME VARCHAR(512) DEFAULT NULL,
  NODE_ID VARCHAR(1024) DEFAULT NULL,
  NODE_NAME VARCHAR(1024) DEFAULT NULL,
  AUSER VARCHAR(64) DEFAULT NULL,
  GUID VARCHAR(64) NOT NULL,
  PRIMARY KEY (GUID),
  ARCHIVE_TIME TIMESTAMP
)
;

CREATE TABLE FIXFLOW_AGENT_AGENTINFO (
  AGENT_ID VARCHAR(64) NOT NULL,
  ODATE TIMESTAMP,
  OPERATOR VARCHAR(64) DEFAULT NULL,
  SDATE TIMESTAMP,
  EDATE TIMESTAMP,
  VIEW_TYPE VARCHAR(64) DEFAULT NULL,
  STATUS VARCHAR(20) DEFAULT NULL,
  RESERVER1 VARCHAR(64) DEFAULT NULL,
  RESERVER2 VARCHAR(64) DEFAULT NULL,
  PRIMARY KEY (AGENT_ID),
  ARCHIVE_TIME TIMESTAMP
)
;

CREATE TABLE FIXFLOW_DEF_BYTEARRAY
(
  ID            VARCHAR(64) NOT NULL,
  REV           DECIMAL(12),
  NAME          VARCHAR(512),
  BYTES         BLOB,
  DEPLOYMENT_ID VARCHAR(256),
  ARCHIVE_TIME TIMESTAMP
)
;

CREATE TABLE FIXFLOW_DEF_DEPLOYMENT
(
  ID          VARCHAR(64) NOT NULL,
  NAME        VARCHAR(512),
  DEPLOY_TIME TIMESTAMP,
  ARCHIVE_TIME TIMESTAMP
)
;
ALTER TABLE FIXFLOW_DEF_DEPLOYMENT
  ADD CONSTRAINT FIXFLOW_DEF_DEPLOYMENT_PK PRIMARY KEY (ID)
;

CREATE TABLE FIXFLOW_DEF_PROCESSDEFINITION
(
  DIFINITIONS_KEY       VARCHAR(512),
  DIFINITIONS_ID        VARCHAR(512),
  PROCESS_KEY           VARCHAR(512),
  PROCESS_ID            VARCHAR(500) NOT NULL,
  CATEGORY              VARCHAR(255),
  PROCESS_NAME          VARCHAR(255),
  VERSION               INTEGER,
  RESOURCE_NAME         VARCHAR(4000),
  DEPLOYMENT_ID         VARCHAR(64),
  DIAGRAM_RESOURCE_NAME VARCHAR(512),
  START_FORM_KEY        VARCHAR(1024),
  RESOURCE_ID           VARCHAR(64),
  SUB_TASK_ID           VARCHAR(128),
  ARCHIVE_TIME TIMESTAMP
)
;

ALTER TABLE FIXFLOW_DEF_PROCESSDEFINITION
  ADD CONSTRAINT FIXFLOW_DEF_PROCESSDEFINI_PK PRIMARY KEY (PROCESS_ID)
;


CREATE TABLE FIXFLOW_MAIL
(
  MAIL_ID        VARCHAR(128) NOT NULL,
  MAIL_NAME      VARCHAR(4000),
  MAIL_TO        VARCHAR(4000),
  MAIL_SUBJECT   VARCHAR(4000),
  MAIL_BODY      BLOB,
  BIZ_TYPE       VARCHAR(128),
  BIZ_VALUE      VARCHAR(512),
  MAIL_STATUS    VARCHAR(64),
  CREATE_TIME    TIMESTAMP,
  SEND_TIME      TIMESTAMP,
  MAIL_CC        VARCHAR(4000),
  CREATE_USER    VARCHAR(64),
  FAILURE_REASON VARCHAR(4000),
  ARCHIVE_TIME TIMESTAMP
)
;

ALTER TABLE FIXFLOW_MAIL
  ADD CONSTRAINT FIXFLOW_MAIL_PK PRIMARY KEY (MAIL_ID)
;

CREATE TABLE FIXFLOW_RUN_IDENTITYLINK
(
  ID              VARCHAR(64) NOT NULL,
  TYPE            VARCHAR(64),
  USER_ID         VARCHAR(64),
  ROLE_ID         VARCHAR(64),
  DEPT_ID         VARCHAR(64),
  TASKINSTANCE_ID VARCHAR(64),
  ARCHIVE_TIME TIMESTAMP
)
;
ALTER TABLE FIXFLOW_RUN_IDENTITYLINK
  ADD CONSTRAINT FIXFLOW_RUN_IDENTITYLINK_PK PRIMARY KEY (ID)
;

CREATE TABLE FIXFLOW_RUN_PROCESSINSTANCE
(
  PROCESSINSTANCE_ID       VARCHAR(64) NOT NULL,
  PROCESSDEFINITION_ID      VARCHAR(512),
  SUBJECT                  VARCHAR(4000),
  START_TIME               TIMESTAMP,
  END_TIME                 TIMESTAMP,
  DEFINITION_ID            VARCHAR(64),
  ROOTTOKEN_ID             VARCHAR(64),
  BIZ_KEY                  VARCHAR(64),
  INITIATOR                VARCHAR(64),
  ISSUSPENDED              VARCHAR(20),
  PROCESSDEFINITION_KEY    VARCHAR(512),
  PARENT_INSTANCE_ID       VARCHAR(64),
  PARENT_INSTANCE_TOKEN_ID VARCHAR(64),
  UPDATE_TIME              TIMESTAMP,
  INSTANCE_TYPE            VARCHAR(45),
  START_AUTHOR VARCHAR(64),
  PROCESSLOCATION          VARCHAR(2048),
  ISPIGEONHOLE	           VARCHAR(1),
  INSTANCE_STATUS          VARCHAR(45),
  ARCHIVE_TIME TIMESTAMP
)
;

ALTER TABLE FIXFLOW_RUN_PROCESSINSTANCE
  ADD CONSTRAINT FIXFLOW_RUN_PROCESSINSTAN_PK PRIMARY KEY (PROCESSINSTANCE_ID)
;

CREATE TABLE FIXFLOW_RUN_TASKINSTANCE
(
  TASKINSTANCE_ID       VARCHAR(64) NOT NULL,
  PROCESSINSTANCE_ID    VARCHAR(64),
  PROCESSDEFINITION_ID   VARCHAR(512),
  VERSION               INTEGER,
  TOKEN_ID              VARCHAR(64),
  NODE_ID               VARCHAR(64),
  DESCRIPTION           VARCHAR(4000),
  PARENTTASK_ID         VARCHAR(64),
  ASSIGNEE              VARCHAR(64),
  CLAIM_TIME            TIMESTAMP,
  NAME                  VARCHAR(255),
  CREATE_TIME           TIMESTAMP,
  START_TIME            TIMESTAMP,
  ISBLOCKING            VARCHAR(20),
  END_TIME              TIMESTAMP,
  DUEDATE               TIMESTAMP,
  PRIORITY              DECIMAL(6),
  CATEGORY              VARCHAR(64),
  OWNER                 VARCHAR(64),
  DELEGATIONSTATESTRING VARCHAR(64),
  BIZKEY                VARCHAR(64),
  COMMAND_TYPE          VARCHAR(256),
  COMMAND_MESSAGE       VARCHAR(256),
  TASK_COMMENT          VARCHAR(4000),
  NODE_NAME             VARCHAR(512),
  PROCESSDEFINITION_KEY VARCHAR(512),
  FORMURI               VARCHAR(256),
  TASKGROUP             VARCHAR(64),
  TASKTYPE              VARCHAR(64),
  PROCESSDEFINITION_NAME VARCHAR(512),
  ISCANCELLED VARCHAR(64),
  ISSUSPENDED VARCHAR(64),
  ISOPEN VARCHAR(64),
  ISDRAFT VARCHAR(64),
  EXPECTED_EXECUTIONTIME NUMERIC (12,0),
  AGENT VARCHAR(64),
  ADMIN VARCHAR(64),
  FORMURIVIEW VARCHAR(512),
  CALLACTIVITY_INSTANCE_ID VARCHAR(256),
  COMMAND_ID VARCHAR(64),
  PENDINGTASKID VARCHAR(64),
  ARCHIVE_TIME TIMESTAMP
)
;

ALTER TABLE FIXFLOW_RUN_TASKINSTANCE
  ADD CONSTRAINT FIXFLOW_RUN_TASKINSTANCE_PK PRIMARY KEY (TASKINSTANCE_ID)
;
CREATE INDEX INDEX12 ON FIXFLOW_RUN_TASKINSTANCE (ISBLOCKING)
;
CREATE INDEX INDEX19 ON FIXFLOW_RUN_TASKINSTANCE (PROCESSINSTANCE_ID)
;
CREATE INDEX INDEX2 ON FIXFLOW_RUN_TASKINSTANCE (ASSIGNEE)
;
CREATE INDEX INDEX6 ON FIXFLOW_RUN_TASKINSTANCE (CREATE_TIME)
;

CREATE TABLE FIXFLOW_RUN_TASKIDENTITYLINK
(
  ID                VARCHAR(64) NOT NULL,
  TYPE              VARCHAR(64),
  USER_ID           VARCHAR(64),
  GROUP_ID          VARCHAR(64),
  GROUP_TYPE        VARCHAR(64),
  TASKINSTANCE_ID   VARCHAR(64),
  INCLUDE_EXCLUSION VARCHAR(64),
  ARCHIVE_TIME TIMESTAMP
)
;
ALTER TABLE FIXFLOW_RUN_TASKIDENTITYLINK
  ADD CONSTRAINT FIXFLOW_RUN_TASKIDENTITYL_PK PRIMARY KEY (ID)
;

CREATE TABLE FIXFLOW_RUN_TOKEN
(
  TOKEN_ID                 VARCHAR(64) NOT NULL,
  NAME                     VARCHAR(128),
  START_TIME               TIMESTAMP,
  END_TIME                 TIMESTAMP,
  NODEENTER_TIME           TIMESTAMP,
  ISABLETOREACTIVATEPARENT VARCHAR(64),
  ISSUSPENDED              VARCHAR(64),
  TOKEN_LOCK               VARCHAR(64),
  NODE_ID                  VARCHAR(128),
  PROCESSINSTANCE_ID       VARCHAR(64),
  PARENT_ID                VARCHAR(64),
  ISSUBPROCESSROOTTOKEN    VARCHAR(20),
  FREETOKEN                VARCHAR(64),
  PARENT_FREETOKEN_ID      VARCHAR(64),
  ARCHIVE_TIME TIMESTAMP
)
;

ALTER TABLE FIXFLOW_RUN_TOKEN
  ADD CONSTRAINT FIXFLOW_RUN_TOKEN_PK PRIMARY KEY (TOKEN_ID)
;
CREATE INDEX INDEX22 ON FIXFLOW_RUN_TOKEN (PROCESSINSTANCE_ID)
;

CREATE TABLE FIXFLOW_RUN_VARIABLE
(
  PROCESSINSTANCE_ID VARCHAR(64),
  VARIABLE_KEY       VARCHAR(64),
  VARIABLE_VALUE     BLOB,
  VARIABLE_CLASSNAME VARCHAR(64),
  TASKINSTANCE_ID VARCHAR(64),
  TOKEN_ID VARCHAR(64),
  NODE_ID  VARCHAR(512),
  ARCHIVE_TIME TIMESTAMP,
  VARIABLE_TYPE VARCHAR(45),
  BIZ_DATA VARCHAR(2048)
)
;

CREATE INDEX INDEX30 ON FIXFLOW_RUN_VARIABLE (PROCESSINSTANCE_ID)
;

CREATE TABLE FIXFLOW_WORKDATE_DES
(

  RULE_ID         VARCHAR(64) NOT NULL,
  WEEK_NUM        VARCHAR(64) NOT NULL,
  AM_PM          VARCHAR(64) NOT NULL,
  BEGIN_DATE      VARCHAR(64),
  END_DATE        VARCHAR(64),
  ARCHIVE_TIME TIMESTAMP
)
;
ALTER TABLE FIXFLOW_WORKDATE_DES ADD CONSTRAINT PK_FIXFLOW_WORKDATE_DES PRIMARY KEY (RULE_ID,WEEK_NUM,AM_PM)
;

CREATE TABLE FIXFLOW_WORKDATE_DETAIL
(
  RULE_ID          VARCHAR(64) NOT NULL,
  COMMOM_DATE     VARCHAR(64) NOT NULL,
  BEGIN_DATE      VARCHAR(64),
  END_DATE        VARCHAR(64),
  AM_PM          VARCHAR(64) NOT NULL,
  IS_WORK      INTEGER,
  MINUTES      INTEGER,
  ARCHIVE_TIME TIMESTAMP
)
;
ALTER TABLE FIXFLOW_WORKDATE_DETAIL ADD CONSTRAINT PK_FIXFLOW_WORKDATE_DETAIL PRIMARY KEY (COMMOM_DATE,AM_PM,RULE_ID)
;

CREATE TABLE FIXFLOW_WORKDATE_RULE
(
  RULE_ID         VARCHAR(64) NOT NULL,
  RULE_NAME      VARCHAR(64),
  RULE_DESC       VARCHAR(512),
  CREATE_DATE      VARCHAR(512),
  CREATE_USERID    VARCHAR(64),
  CREATE_USERNAME VARCHAR(64),
  FIELD1          VARCHAR(64),
  FIELD2          VARCHAR(64),
  ARCHIVE_TIME TIMESTAMP
)
;
ALTER TABLE FIXFLOW_WORKDATE_RULE ADD CONSTRAINT PK_FIXFLOW_WORKDATE_RULE PRIMARY KEY (RULE_ID)
;

CREATE TABLE FIXFLOW_WORKDATE_SPEC
(
  RULE_ID          VARCHAR(64) NOT NULL,
  SPEC_DATE       VARCHAR(64)NOT NULL,
  BEGIN_DATE      VARCHAR(64),
  END_DATE        VARCHAR(64),
  AM_PM           VARCHAR(64) NOT NULL,
  ARCHIVE_TIME TIMESTAMP
)
;
ALTER TABLE FIXFLOW_WORKDATE_SPEC ADD CONSTRAINT PK_FIXFLOW_WORKDATE_SPEC PRIMARY KEY (SPEC_DATE,AM_PM)
;

CREATE TABLE FIXFLOW_HIS_PROCESSINSTANCE
(
  PROCESSINSTANCE_ID       VARCHAR(64) NOT NULL,
  PROCESSDEFINITION_ID      VARCHAR(512),
  SUBJECT                  VARCHAR(4000),
  START_TIME               TIMESTAMP,
  END_TIME                 TIMESTAMP,
  DEFINITION_ID            VARCHAR(64),
  ROOTTOKEN_ID             VARCHAR(64),
  BIZ_KEY                  VARCHAR(64),
  INITIATOR                VARCHAR(64),
  ISSUSPENDED              VARCHAR(20),
  PROCESSDEFINITION_KEY    VARCHAR(512),
  PARENT_INSTANCE_ID       VARCHAR(64),
  PARENT_INSTANCE_TOKEN_ID VARCHAR(64),
  UPDATE_TIME              TIMESTAMP,
  INSTANCE_TYPE            VARCHAR(45),
  START_AUTHOR VARCHAR(64),
  PROCESSLOCATION          VARCHAR(2048),
    ISPIGEONHOLE		VARCHAR(1),
    INSTANCE_STATUS          VARCHAR(45),
  ARCHIVE_TIME TIMESTAMP
)
;

ALTER TABLE FIXFLOW_HIS_PROCESSINSTANCE
  ADD CONSTRAINT FIXFLOW_HIS_PROCESSINSTAN_PK PRIMARY KEY (PROCESSINSTANCE_ID)
;

CREATE TABLE FIXFLOW_HIS_IDENTITYLINK
(
  ID              VARCHAR(64) NOT NULL,
  TYPE            VARCHAR(64),
  USER_ID         VARCHAR(64),
  ROLE_ID         VARCHAR(64),
  DEPT_ID         VARCHAR(64),
  TASKINSTANCE_ID VARCHAR(64),
  ARCHIVE_TIME TIMESTAMP
)
;
ALTER TABLE FIXFLOW_HIS_IDENTITYLINK
  ADD CONSTRAINT FIXFLOW_HIS_IDENTITYLINK_PK PRIMARY KEY (ID)
;

CREATE TABLE FIXFLOW_HIS_TASKINSTANCE
(
  TASKINSTANCE_ID       VARCHAR(64) NOT NULL,
  PROCESSINSTANCE_ID    VARCHAR(64),
  PROCESSDEFINITION_ID   VARCHAR(512),
  VERSION               INTEGER,
  TOKEN_ID              VARCHAR(64),
  NODE_ID               VARCHAR(64),
  DESCRIPTION           VARCHAR(4000),
  PARENTTASK_ID         VARCHAR(64),
  ASSIGNEE              VARCHAR(64),
  CLAIM_TIME            TIMESTAMP,
  NAME                  VARCHAR(255),
  CREATE_TIME           TIMESTAMP,
  START_TIME            TIMESTAMP,
  ISBLOCKING            VARCHAR(20),
  END_TIME              TIMESTAMP,
  DUEDATE               TIMESTAMP,
  PRIORITY              DECIMAL(6),
  CATEGORY              VARCHAR(64),
  OWNER                 VARCHAR(64),
  DELEGATIONSTATESTRING VARCHAR(64),
  BIZKEY                VARCHAR(64),
  COMMAND_TYPE          VARCHAR(256),
  COMMAND_MESSAGE       VARCHAR(256),
  TASK_COMMENT          VARCHAR(4000),
  NODE_NAME             VARCHAR(512),
  PROCESSDEFINITION_KEY VARCHAR(512),
  FORMURI               VARCHAR(256),
  TASKGROUP             VARCHAR(64),
  TASKTYPE              VARCHAR(64),
  PROCESSDEFINITION_NAME VARCHAR(512),
  ISCANCELLED VARCHAR(64),
  ISSUSPENDED VARCHAR(64),
  ISOPEN VARCHAR(64),
  ISDRAFT VARCHAR(64),
  EXPECTED_EXECUTIONTIME NUMERIC (12,0),
  AGENT VARCHAR(64),
  ADMIN VARCHAR(64),
  FORMURIVIEW VARCHAR(512),
  CALLACTIVITY_INSTANCE_ID VARCHAR(256),
  COMMAND_ID VARCHAR(64),
  PENDINGTASKID VARCHAR(64),
  ARCHIVE_TIME TIMESTAMP
)
;

ALTER TABLE FIXFLOW_HIS_TASKINSTANCE
  ADD CONSTRAINT FIXFLOW_HIS_TASKINSTANCE_PK PRIMARY KEY (TASKINSTANCE_ID)
;
CREATE INDEX INDEX12 ON FIXFLOW_HIS_TASKINSTANCE (ISBLOCKING)
;
CREATE INDEX INDEX19 ON FIXFLOW_HIS_TASKINSTANCE (PROCESSINSTANCE_ID)
;
CREATE INDEX INDEX2 ON FIXFLOW_HIS_TASKINSTANCE (ASSIGNEE)
;
CREATE INDEX INDEX6 ON FIXFLOW_HIS_TASKINSTANCE (CREATE_TIME)
;

CREATE TABLE FIXFLOW_HIS_TASKIDENTITYLINK
(
  ID                VARCHAR(64) NOT NULL,
  TYPE              VARCHAR(64),
  USER_ID           VARCHAR(64),
  GROUP_ID          VARCHAR(64),
  GROUP_TYPE        VARCHAR(64),
  TASKINSTANCE_ID   VARCHAR(64),
  INCLUDE_EXCLUSION VARCHAR(64),
  ARCHIVE_TIME TIMESTAMP
)
;
ALTER TABLE FIXFLOW_HIS_TASKIDENTITYLINK
  ADD CONSTRAINT FIXFLOW_HIS_TASKIDENTITYL_PK PRIMARY KEY (ID)
;

CREATE TABLE FIXFLOW_HIS_TOKEN
(
  TOKEN_ID                 VARCHAR(64) NOT NULL,
  NAME                     VARCHAR(128),
  START_TIME               TIMESTAMP,
  END_TIME                 TIMESTAMP,
  NODEENTER_TIME           TIMESTAMP,
  ISABLETOREACTIVATEPARENT VARCHAR(64),
  ISSUSPENDED              VARCHAR(64),
  TOKEN_LOCK               VARCHAR(64),
  NODE_ID                  VARCHAR(128),
  PROCESSINSTANCE_ID       VARCHAR(64),
  PARENT_ID                VARCHAR(64),
  ISSUBPROCESSROOTTOKEN    VARCHAR(20),
  FREETOKEN                VARCHAR(64),
  PARENT_FREETOKEN_ID      VARCHAR(64),
  ARCHIVE_TIME TIMESTAMP
)
;

ALTER TABLE FIXFLOW_HIS_TOKEN
  ADD CONSTRAINT FIXFLOW_HIS_TOKEN_PK PRIMARY KEY (TOKEN_ID)
;
CREATE INDEX INDEX22 ON FIXFLOW_HIS_TOKEN (PROCESSINSTANCE_ID)
;

CREATE TABLE FIXFLOW_HIS_VARIABLE
(
  PROCESSINSTANCE_ID VARCHAR(64),
  VARIABLE_KEY       VARCHAR(64),
  VARIABLE_VALUE     BLOB,
  VARIABLE_CLASSNAME VARCHAR(64),
  TASKINSTANCE_ID VARCHAR(64),
  TOKEN_ID VARCHAR(64),
  NODE_ID  VARCHAR(512),
  ARCHIVE_TIME TIMESTAMP,
  VARIABLE_TYPE VARCHAR(45),
  BIZ_DATA VARCHAR(2048)
)
;

CREATE INDEX INDEX30 ON FIXFLOW_HIS_VARIABLE (PROCESSINSTANCE_ID)
;

CREATE TABLE AU_ORGINFO
(
  ORGID      VARCHAR(50) NOT NULL,
  SUPORGID   VARCHAR(50),
  ORGNAME    VARCHAR(200),
  ORGLEVELID VARCHAR(50),
  UPDATE_BY  VARCHAR(50),
  UPDATE_DT  TIMESTAMP,
  CREATE_BY  VARCHAR(50),
  UNIT_TYPE  VARCHAR(50),
  CREATE_DT  TIMESTAMP,
  ONSTATUS   DECIMAL(12),
  SORT_ORDER DECIMAL(12),
  ORGPATH VARCHAR(800),
  ARCHIVE_TIME TIMESTAMP
)
;

ALTER TABLE AU_ORGINFO
  ADD CONSTRAINT PK_AU_ORGINFO PRIMARY KEY (ORGID)
;

CREATE TABLE AU_ROLEINFO
(
  ROLEID       VARCHAR(50) NOT NULL,
  NAME         VARCHAR(50),
  BIZTYPE      VARCHAR(50),
  PRUGROUP     VARCHAR(50),
  PLATFORM     VARCHAR(50),
  MEMO         VARCHAR(500),
  UPDATE_BY    VARCHAR(50),
  CREATE_BY    VARCHAR(50),
  CREATE_DT    TIMESTAMP,
  UPDATE_DT    TIMESTAMP,
  CREATE_ORGID VARCHAR(50),
  STATUS VARCHAR(10),
  LEVELNUM INTEGER,
  ENAME VARCHAR(128),
  ARCHIVE_TIME TIMESTAMP
)
;

ALTER TABLE AU_ROLEINFO
  ADD CONSTRAINT PK_AU_ROLEINFO PRIMARY KEY (ROLEID)
;

CREATE TABLE AU_USERINFO
(
  USERID        VARCHAR(50) NOT NULL,
  USERNAME      VARCHAR(50),
  LOGINID       VARCHAR(50),
  JOBID         VARCHAR(50),
  PASSWORD      VARCHAR(50),
  CONF_PASSWORD VARCHAR(50),
  ISADMIN       INTEGER DEFAULT 0,
  EMAIL         VARCHAR(50),
  TELEPHONE     VARCHAR(30),
  MOBILEPHONE   VARCHAR(30),
  FAX           VARCHAR(30),
  TITLEOFPOST   VARCHAR(30),
  WORKED_TIME   TIMESTAMP,
  ISENABLE      INTEGER DEFAULT 1,
  MEMO          VARCHAR(1000),
  CREATE_BY     VARCHAR(50),
  CREATE_DT     TIMESTAMP,
  UPDATE_BY     VARCHAR(50),
  UPDATE_DT    TIMESTAMP,
  SSOID         VARCHAR(50),
  POSITION		VARCHAR(64),
  LOCATION_NAME VARCHAR(64),
  IMG VARCHAR(64),
  SUPERLEADER  VARCHAR(64),
  ARCHIVE_TIME TIMESTAMP
)
;

ALTER TABLE AU_USERINFO
  ADD CONSTRAINT PK_AU_USERINFO PRIMARY KEY (USERID)
;

CREATE TABLE FIX_GROUP_RELATION
(
  GUID          VARCHAR(50) NOT NULL,
  USER_ID    VARCHAR(50) NOT NULL,
  GROUP_ID      VARCHAR(50) NOT NULL,
  GROUP_TYPE    VARCHAR(50) NOT NULL,
  IS_PRIDUTY VARCHAR(50),
  IS_DEPUTE  VARCHAR(10),
  CREATE_DT     TIMESTAMP NOT NULL,
  UPDATE_DT     TIMESTAMP NOT NULL,
  CREATE_BY     VARCHAR(50) NOT NULL,
  UPDATE_BY     VARCHAR(50) NOT NULL,
  ARCHIVE_TIME TIMESTAMP
)
;

ALTER TABLE FIX_GROUP_RELATION
  ADD PRIMARY KEY (GUID)
;





DROP TABLE QRTZ_FIRED_TRIGGERS
;
DROP TABLE QRTZ_PAUSED_TRIGGER_GRPS
;
DROP TABLE QRTZ_SCHEDULER_STATE
;
DROP TABLE QRTZ_LOCKS
;
DROP TABLE QRTZ_SIMPLE_TRIGGERS
;
DROP TABLE QRTZ_SIMPROP_TRIGGERS
;
DROP TABLE QRTZ_CRON_TRIGGERS
;
DROP TABLE QRTZ_TRIGGERS
;
DROP TABLE QRTZ_JOB_DETAILS
;
DROP TABLE QRTZ_CALENDARS
;
DROP TABLE QRTZ_BLOB_TRIGGERS
;

create table qrtz_job_details(
sched_name varchar(120) not null,
job_name varchar(80) not null,
job_group varchar(80) not null,
description varchar(120),
job_class_name varchar(128) not null,
is_durable integer not null,
is_nonconcurrent integer not null,
is_update_data integer not null,
requests_recovery integer not null,
job_data blob(2000),
primary key (sched_name,job_name,job_group)
)
;

create table qrtz_triggers(
sched_name varchar(120) not null,
trigger_name varchar(80) not null,
trigger_group varchar(80) not null,
job_name varchar(80) not null,
job_group varchar(80) not null,
description varchar(120),
next_fire_time bigint,
prev_fire_time bigint,
priority integer,
trigger_state varchar(16) not null,
trigger_type varchar(8) not null,
start_time bigint not null,
end_time bigint,
calendar_name varchar(80),
misfire_instr smallint,
job_data blob(2000),
primary key (sched_name,trigger_name,trigger_group),
foreign key (sched_name,job_name,job_group) references qrtz_job_details(sched_name,job_name,job_group)
)
;

create table qrtz_simple_triggers(
sched_name varchar(120) not null,
trigger_name varchar(80) not null,
trigger_group varchar(80) not null,
repeat_count bigint not null,
repeat_interval bigint not null,
times_triggered bigint not null,
primary key (sched_name,trigger_name,trigger_group),
foreign key (sched_name,trigger_name,trigger_group) references qrtz_triggers(sched_name,trigger_name,trigger_group)
)
;

create table qrtz_cron_triggers(
sched_name varchar(120) not null,
trigger_name varchar(80) not null,
trigger_group varchar(80) not null,
cron_expression varchar(120) not null,
time_zone_id varchar(80),
primary key (sched_name,trigger_name,trigger_group),
foreign key (sched_name,trigger_name,trigger_group) references qrtz_triggers(sched_name,trigger_name,trigger_group)
)
;

CREATE TABLE qrtz_simprop_triggers
  (          
    sched_name varchar(120) not null,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    STR_PROP_1 VARCHAR(512),
    STR_PROP_2 VARCHAR(512),
    STR_PROP_3 VARCHAR(512),
    INT_PROP_1 INT,
    INT_PROP_2 INT,
    LONG_PROP_1 BIGINT,
    LONG_PROP_2 BIGINT,
    DEC_PROP_1 NUMERIC(13,4),
    DEC_PROP_2 NUMERIC(13,4),
    BOOL_PROP_1 VARCHAR(1),
    BOOL_PROP_2 VARCHAR(1),
    PRIMARY KEY (sched_name,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (sched_name,TRIGGER_NAME,TRIGGER_GROUP) 
    REFERENCES QRTZ_TRIGGERS(sched_name,TRIGGER_NAME,TRIGGER_GROUP)
)
;

create table qrtz_blob_triggers(
sched_name varchar(120) not null,
trigger_name varchar(80) not null,
trigger_group varchar(80) not null,
blob_data blob(2000),
primary key (sched_name,trigger_name,trigger_group),
foreign key (sched_name,trigger_name,trigger_group) references qrtz_triggers(sched_name,trigger_name,trigger_group)
)
;

create table qrtz_calendars(
sched_name varchar(120) not null,
calendar_name varchar(80) not null,
calendar blob(2000) not null,
primary key (calendar_name)
)
;

create table qrtz_fired_triggers(
sched_name varchar(120) not null,
entry_id varchar(95) not null,
trigger_name varchar(80) not null,
trigger_group varchar(80) not null,
instance_name varchar(80) not null,
fired_time bigint not null,
priority integer not null,
state varchar(16) not null,
job_name varchar(80),
job_group varchar(80),
is_nonconcurrent integer,
requests_recovery integer,
primary key (sched_name,entry_id)
)
;

create table qrtz_paused_trigger_grps(
sched_name varchar(120) not null,
trigger_group varchar(80) not null,
primary key (sched_name,trigger_group)
)
;

create table qrtz_scheduler_state(
sched_name varchar(120) not null,
instance_name varchar(80) not null,
last_checkin_time bigint not null,
checkin_interval bigint not null,
primary key (sched_name,instance_name)
)
;

create table qrtz_locks(
sched_name varchar(120) not null,
lock_name varchar(40) not null,
primary key (sched_name,lock_name)
)
;
