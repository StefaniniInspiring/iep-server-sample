CREATE TABLE IF NOT EXISTS coupon (
   code             VARCHAR,
   template_id      VARCHAR,
   configuration_id VARCHAR,
   actor_id         VARCHAR,
   state            VARCHAR,
   attributes       MAP<VARCHAR,VARCHAR>,
   date_expiry      TIMESTAMP,
   date_creation    TIMESTAMP,
   date_update      TIMESTAMP,
   date_conceded    TIMESTAMP,
   PRIMARY KEY (code, template_id)
);

CREATE TABLE IF NOT EXISTS coupon_inventory_total (
   template_id      VARCHAR,
   total            INT,
   PRIMARY KEY (template_id)
);

CREATE TABLE IF NOT EXISTS coupon_inventory (
   code             VARCHAR,
   template_id      VARCHAR,
   actor_id         VARCHAR,
   PRIMARY KEY (template_id, actor_id, code)
);

CREATE TABLE IF NOT EXISTS coupon_conceded (
   actor_id         VARCHAR,
   date             TIMESTAMP,
   code             VARCHAR,
   template_id      VARCHAR,
   state            VARCHAR,
   PRIMARY KEY (actor_id, date, code, template_id)
) WITH CLUSTERING ORDER BY (date DESC, code ASC, template_id ASC);

CREATE TABLE IF NOT EXISTS coupon_conceded_by_state (
   actor_id         VARCHAR,
   state            VARCHAR,
   date             TIMESTAMP,
   code             VARCHAR,
   template_id      VARCHAR,
   PRIMARY KEY (actor_id, state, date, code, template_id)
) WITH CLUSTERING ORDER BY (state ASC, date DESC, code ASC, template_id ASC);
