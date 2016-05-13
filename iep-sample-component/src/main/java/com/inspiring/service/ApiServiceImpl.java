package com.inspiring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.cassandra.thrift.cassandraConstants;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.inspiring.db.PersonCassandraRepository;
import com.inspiring.model.Person;
import com.inspiring.smarketus.commons.exceptions.SmarketusException;

@Service
public class ApiServiceImpl {
	
	Logger log = Logger.getLogger(ApiServiceImpl.class);    
	
	Map<String,String> params = new HashMap<String,String>();
	
	String url = "http://localhost:8085/rs/actor/type/{type}/key/{keyName}/value/{keyValue}";
	
	@Autowired
	PersonCassandraRepository personCassandraRepository;
	
	public String get(String type,String keyName, String value){
		
		RestTemplate restTemplate = new RestTemplate();
		params.put("type", type);
		params.put("keyName", keyName);
		params.put("keyValue", value);
		
		String response = restTemplate.getForObject(url,String.class,params);
		log.info(response);
		return response;
	}

	public void insertPerson(Person person) throws SmarketusException {
		personCassandraRepository.insertPerson(person);		
	}
	
	public List<Person> getPerson(String personId) throws SmarketusException {
		return personCassandraRepository.selectPerson(personId);		
	}
}
