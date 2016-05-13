CREATE TABLE IF NOT EXISTS mob_message_new (
    actor_id      VARCHAR,
    message_id    VARCHAR,
    qty           INT,
    PRIMARY KEY (actor_id, message_id)
);

CREATE TABLE IF NOT EXISTS mob_message (
    actor_id      VARCHAR,
    message_id    VARCHAR,
    status        VARCHAR,  /* READ or UNREAD */
    create_date   TIMEUUID, /* usado também como ID */
    template_id   VARCHAR,
    title         VARCHAR,
    summary       VARCHAR,
    body          VARCHAR,
    push_data     VARCHAR,
    PRIMARY KEY (actor_id, message_id, create_date)
) WITH CLUSTERING ORDER BY (message_id ASC, create_date DESC);

CREATE TABLE IF NOT EXISTS mob_message_archive (
    actor_id      VARCHAR,
    message_id    VARCHAR,
    status        VARCHAR,
    create_date   TIMEUUID,
    archive_date  TIMESTAMP, /* data em que a mensagem foi aquivada */
    delete_date   TIMESTAMP, /* data em que ocorrera a delecao de fato da mensagem */
    template_id   VARCHAR,
    title         VARCHAR,
    summary       VARCHAR,
    body          VARCHAR,
    push_data     VARCHAR,
    PRIMARY KEY (actor_id, message_id, create_date)
) WITH CLUSTERING ORDER BY (message_id ASC, create_date DESC);

CREATE TABLE IF NOT EXISTS mob_message_by_id (
    create_date   TIMEUUID, /* usado também como ID */
    actor_id      VARCHAR,
    message_id    VARCHAR,
    PRIMARY KEY (create_date, actor_id, message_id)
);