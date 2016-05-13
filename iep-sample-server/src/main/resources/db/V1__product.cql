CREATE TABLE IF NOT EXISTS product (
  product_id         VARCHAR,
  product_type       VARCHAR,
  attributes         VARCHAR,
  keys               MAP<VARCHAR,VARCHAR>,
  keywords           SET<VARCHAR>,
  lucene             VARCHAR,
  PRIMARY KEY(product_id, product_type)
);

CREATE TABLE IF NOT EXISTS product_by_key (
  product_type       VARCHAR,
  key_name           VARCHAR,
  key_value          VARCHAR,
  product_id         VARCHAR,
  PRIMARY KEY(product_type, key_name, key_value)
);
