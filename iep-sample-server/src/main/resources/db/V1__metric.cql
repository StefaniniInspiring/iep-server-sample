CREATE TABLE IF NOT EXISTS metric (
    id                     VARCHAR, /* Identificador da métrica, definido na configuracao. */
    dim_entity_type        VARCHAR, /* Tipo da entidade ou nulo. Exemplo: EVENT, ACTOR, CAMPAIGN */
    dim_entity_name        VARCHAR, /* Identificador da entidade ou nulo. Exemplo: Cliente, Compra, Venda */
    dim_entity_id          VARCHAR, /* Identificador da instancia da entidade ou nulo.  */
    dim_custom_name        VARCHAR, /* Valor definido na configuracao. Exemplo: UF, Região, Cidade */
    dim_custom_value       VARCHAR, /* Valor obtido do atributo. Exemplo: SP, Sudeste, Osasco */
    dim_time_unit          VARCHAR, /* Unidade de tempo: I (infinito), H (hora), D (dia), M (mes), Y (ano) */
    values                 Map<INT, DECIMAL>, /* Valores indexados pela dimensão tempo.*/
    PRIMARY KEY(id, dim_entity_type, dim_entity_name, dim_entity_id, dim_custom_name, dim_custom_value, dim_time_unit)
);