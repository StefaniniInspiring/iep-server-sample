DROP TABLE IF EXISTS CAMPAIGN;

CREATE TABLE IF NOT EXISTS CAMPAIGN_BY_ACTOR (
    HOST_PK            INT,
    ACTOR_ID           VARCHAR,
    CONTRACT_ID        VARCHAR,
    ID                 VARCHAR,
    CONTROL_GROUP      BOOLEAN,
    STATE_CURRENT      VARCHAR,
    STATE_OLD          VARCHAR,
    STATES_COVERED     VARCHAR,
    ACTIONS_EXECUTED   VARCHAR,
    ACTIONS_SCHEDULED  MAP<VARCHAR, VARCHAR>,
    PRIMARY KEY (ACTOR_ID, ID, CONTRACT_ID)
);

CREATE TABLE IF NOT EXISTS CAMPAIGN_BY_HOST (
    HOST_PK            INT,
    ACTOR_ID           VARCHAR,
    CONTRACT_ID        VARCHAR,
    ID                 VARCHAR,
    CONTROL_GROUP      BOOLEAN,
    STATE_CURRENT      VARCHAR,
    STATE_OLD          VARCHAR,
    STATES_COVERED     VARCHAR,
    ACTIONS_EXECUTED   VARCHAR,
    ACTIONS_SCHEDULED  MAP<VARCHAR, VARCHAR>,
    PRIMARY KEY ((HOST_PK, ID), ACTOR_ID, CONTRACT_ID)
);