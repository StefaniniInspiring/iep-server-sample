CREATE TABLE IF NOT EXISTS custom_message (
    actor_id         VARCHAR,
    message_type     VARCHAR,   /* ID da configuração do tipo da mensagem */
    message_id       TIMEUUID,  /* ID e data de criação da instância da mensagem */
    status           VARCHAR,   /* READ or UNREAD */
    update_date      TIMESTAMP,
    attributes       MAP<VARCHAR, VARCHAR>,
    PRIMARY KEY (actor_id, message_type, message_id)
) WITH CLUSTERING ORDER BY (message_type ASC, message_id DESC);

CREATE TABLE IF NOT EXISTS custom_message_new (
    actor_id         VARCHAR,
    message_type     VARCHAR,
    qty              INT,
    PRIMARY KEY (actor_id, message_type)
);