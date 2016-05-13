CREATE TYPE IF NOT EXISTS feedback_survey_type (
    survey_id           VARCHAR,
    attributes          MAP<VARCHAR, VARCHAR>,
    answer              VARCHAR
);

CREATE TABLE IF NOT EXISTS feedback_by_actor (
    actor_id            VARCHAR,
    feedback_status     VARCHAR,
    feedback_id         TIMEUUID, /* Contém o ID do feedback e sua data de criação */
    template_id         VARCHAR,
    attributes          MAP<VARCHAR, VARCHAR>,
    surveys             LIST<FROZEN <FEEDBACK_SURVEY_TYPE>>,
    update_date         TIMESTAMP,
    PRIMARY KEY(actor_id, feedback_status, feedback_id)
) WITH CLUSTERING ORDER BY (feedback_status ASC, feedback_id DESC);

CREATE TABLE IF NOT EXISTS feedback_by_host (
    host_pk             INT,
    template_id         VARCHAR,
    feedback_id         TIMEUUID, /* Contém o ID do feedback e sua data de criação */
    feedback_status     VARCHAR,
    actor_id            VARCHAR,
    attributes          MAP<VARCHAR, VARCHAR>,
    surveys             LIST<FROZEN <FEEDBACK_SURVEY_TYPE>>,
    update_date         TIMESTAMP,
    PRIMARY KEY((host_pk, template_id), feedback_id)
) WITH CLUSTERING ORDER BY (feedback_id DESC);