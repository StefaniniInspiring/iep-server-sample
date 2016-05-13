CREATE TABLE IF NOT EXISTS loyalty_balance (
      client_id    VARCHAR,
      program_id   VARCHAR,
      value_expiry TIMESTAMP,
      value        BIGINT,
      PRIMARY KEY (client_id, program_id, value_expiry)
);

CREATE TABLE IF NOT EXISTS loyalty_balance_archive (
      client_id    VARCHAR,
      program_id   VARCHAR,
      value_expiry TIMESTAMP,
      value        BIGINT,
      PRIMARY KEY (client_id, program_id, value_expiry)
);

CREATE TABLE IF NOT EXISTS loyalty_transaction (
      client_id      VARCHAR,
      program_id     VARCHAR,
      transaction_id VARCHAR,
      value_expiry   TIMESTAMP,
      value          BIGINT,
      PRIMARY KEY (client_id, program_id, transaction_id, value_expiry)
);

CREATE TABLE IF NOT EXISTS loyalty_transaction_rollback (
      transaction_id VARCHAR,
      rollback_id    VARCHAR,
      PRIMARY KEY (transaction_id)
);

CREATE TABLE IF NOT EXISTS loyalty_history (
      client_id        VARCHAR,
      program_id       VARCHAR,
      operation_type   VARCHAR,
      operation_date   TIMEUUID,
      description      VARCHAR,
      value            BIGINT,
      value_expiry     TIMESTAMP,
      PRIMARY KEY (client_id, program_id, operation_type, operation_date)
);

CREATE TABLE IF NOT EXISTS loyalty_subscription (
      client_id        VARCHAR,
      program_id       VARCHAR,
      join_date        TIMESTAMP,
      PRIMARY KEY (client_id, program_id)
);
