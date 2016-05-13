DROP TABLE IF EXISTS task_host_schedule;
DROP TABLE IF EXISTS task_schedule;
DROP TABLE IF EXISTS task_error;
DROP TABLE IF EXISTS task_checkpoint;

CREATE TABLE IF NOT EXISTS task_schedule_by_host (
	host_pk        INT,
	schedule_date  TIMESTAMP,
	schedule_id    VARCHAR,
	task_plugin    VARCHAR,
	task_name	     VARCHAR,
	task_context   VARCHAR,
	creation_date  TIMESTAMP,
	PRIMARY KEY(host_pk, schedule_date, schedule_id)
);

CREATE TABLE IF NOT EXISTS task_schedule_by_id (
	schedule_date  TIMESTAMP,
	schedule_id    VARCHAR,
	task_plugin    VARCHAR,
	task_name	     VARCHAR,
	task_context   VARCHAR,
	creation_date  TIMESTAMP,
	PRIMARY KEY(schedule_id, schedule_date)
);

CREATE TABLE IF NOT EXISTS task_schedule_error (
	host_pk        INT,
	schedule_date  TIMESTAMP,
	schedule_id    VARCHAR,
	task_plugin    VARCHAR,
	task_name	     VARCHAR,
	task_context   VARCHAR,
  creation_date  TIMESTAMP,
	date           TIMESTAMP,
	cause          VARCHAR,
	PRIMARY KEY(host_pk, schedule_date, schedule_id)
);

CREATE TABLE IF NOT EXISTS task_checkpoint_by_host (
	host_pk        INT,
	last_schedule  TIMESTAMP,
	last_execution TIMESTAMP,
	PRIMARY KEY(host_pk)
);