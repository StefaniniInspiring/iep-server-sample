CREATE TABLE IF NOT EXISTS oauth_client_details (
    client_id                      VARCHAR,
    client_secret                  VARCHAR,
    resource_ids                   SET<VARCHAR>,
    redirect_uris                  SET<VARCHAR>, /* http://anywhere?key=value */
    grant_types                    SET<VARCHAR>, /* password, authorization_code, refresh_token, implicit, client_credentials*/
    authorities                    SET<VARCHAR>, /* USER, ADMIN, etc.. */
    scopes                         MAP<VARCHAR, BOOLEAN>, /* scope:isAutoApproved; scope=read, write, trust, etc..; isAutuApproved=true|false */
    additional_information         MAP<VARCHAR, VARCHAR>,
    refresh_token_validity_secs    INT,
    access_token_validity_secs     INT,
    PRIMARY KEY (client_id)
);