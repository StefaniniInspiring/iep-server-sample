package com.inspiring.db;

import static org.apache.commons.collections4.CollectionUtils.addIgnoreNull;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Statement;
import com.inspiring.model.Person;
import com.inspiring.smarketus.commons.exceptions.SmarketusException;
import com.inspiring.smarketus.infra.cassandra.client.CassandraClient;

@Repository
public class PersonCassandraRepository {

    private static final String CQL_SELECT_PERSON = ""
            + " SELECT person_id,       "
            + "        name,            "
            + "        age,    		    "
            + "        status,          "          
            + " FROM   person           "
            + " WHERE  person_id = ?    ";             
    
    private static final String CQL_INSERT_PERSON = ""
            + " INSERT                  "
            + " INTO   person (   	    "
            + "        person_id,       "
            + "        name,            "           
            + "        age    )         "
            + " VALUES (?, ?, ?)        ";    
    
    
    private @Autowired CassandraClient cassandraClient;    
    
    
    public List<Person> selectPerson(String personId) throws SmarketusException {
        List<Person> people = new ArrayList<>();
        Statement statement = cassandraClient.bind(CQL_SELECT_PERSON, personId);
        ResultSet result = cassandraClient.execute(statement);
        
        for (Row row : result) {            
            addIgnoreNull(people, buildPerson(row)); 
        }
        
        return people;
    } 
    
    public void insertPerson(Person person) throws SmarketusException {        
        
    	cassandraClient.execute(CQL_INSERT_PERSON, 
    			person.getPersonId(),
    			person.getName(),
    			person.getAge() );    
        
    }

    private Person buildPerson(Row row) throws SmarketusException {
        
    	if (row == null) {
            return null;
        }
        
        Person person = new Person();
        person.setPersonId(row.getString("person_id"));
        person.setName(row.getString("name"));
        person.setAge(Integer.parseInt(row.getString("age")));
        
        return person;
    }

}
