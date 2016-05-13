CREATE TABLE IF NOT EXISTS configuration_component (
    component_id      VARCHAR,
    configuration_id  VARCHAR,
    active_time       TIMESTAMP,
    insert_time       TIMESTAMP,
    xml               VARCHAR,
    PRIMARY KEY(component_id, configuration_id, active_time) 
) WITH CLUSTERING ORDER BY (configuration_id ASC, active_time DESC);
