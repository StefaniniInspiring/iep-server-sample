DROP TABLE IF EXISTS system_actor;
DROP INDEX IF EXISTS system_actor_geo_index;

CREATE TABLE IF NOT EXISTS system_actor_by_id (
  actor_id                    VARCHAR,
  actor_type                  VARCHAR,
  attributes                  VARCHAR,
  latitude                    FLOAT,
  longitude                   FLOAT,
  lucene                      VARCHAR,
  keys                        MAP<VARCHAR,VARCHAR>,
  PRIMARY KEY(actor_id, actor_type)
);

CREATE TABLE IF NOT EXISTS system_actor_by_host (
  host_pk                     INT,  
  actor_id                    VARCHAR,
  actor_type                  VARCHAR,
  attributes                  VARCHAR,
  latitude                    FLOAT,
  longitude                   FLOAT,
  keys                        MAP<VARCHAR,VARCHAR>,
  PRIMARY KEY((host_pk, actor_type), actor_id)
);

CREATE TABLE IF NOT EXISTS system_actor_by_key (
  actor_type                  VARCHAR,
  key_name                    VARCHAR,
  key_value                   VARCHAR,
  actor_id                    VARCHAR,
  PRIMARY KEY(actor_type, key_name, key_value)
);

CREATE TABLE IF NOT EXISTS event_status (
  request_id                  VARCHAR,
  running                     BOOLEAN,
  result                      BOOLEAN,
  error_code                  VARCHAR,
  error_message               VARCHAR,
  PRIMARY KEY(request_id)
);

CREATE CUSTOM INDEX IF NOT EXISTS system_actor_by_id_geo_index ON system_actor_by_id(lucene)
 USING 'com.stratio.cassandra.lucene.Index'
 WITH OPTIONS = {
    'refresh_seconds' : '30',
    'schema' : '{
        fields : {
            actor_type  : {type : "string"},
            geolocation : {type : "geo_point", latitude:"latitude", longitude:"longitude"}
        }
    }'
};