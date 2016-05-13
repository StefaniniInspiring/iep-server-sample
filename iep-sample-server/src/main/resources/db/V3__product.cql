ALTER TABLE product ADD score INT /**IGNORE_ERROR**/;

DROP INDEX IF EXISTS product_keywords_index ;

CREATE CUSTOM INDEX IF NOT EXISTS product_keywords_sorted_index ON product(lucene)
    USING 'com.stratio.cassandra.lucene.Index'
    WITH OPTIONS = {
        'refresh_seconds' : '30',
        'schema' : '{
            analyzers : {
                br_analyzer : {
                    type  : "classpath",
                    class : "org.apache.lucene.analysis.br.BrazilianAnalyzer"
                }
            },
            fields : {
                product_type : {type : "string", case_sensitive : true},
                keywords     : {type : "text", case_sensitive : false, analyzer: "br_analyzer"},
                score        : {type : "integer", sorted: true}
            }
        }'
    };