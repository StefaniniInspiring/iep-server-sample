package com.inspiring.service;

import static javax.ws.rs.core.MediaType.APPLICATION_JSON;
import static javax.ws.rs.core.MediaType.APPLICATION_XML;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.inspiring.model.Person;
import com.inspiring.smarketus.commons.exceptions.SmarketusException;
import com.inspiring.smarketus.commons.web.rest.ApiRest;

@Component
@Path("api")
public class APIServiceRest extends ApiRest {

	private static final Logger log = LoggerFactory.getLogger(APIServiceRest.class);

	@Autowired
	ApiServiceImpl apiService;

	@GET
	@Path("teste")
	public Response ping() {
		log.debug("Ping");
		return ok();
	}

	@GET
	@Path("actor/type/{type}/key/{keyName}/value/{keyValue}")
	@Produces({ APPLICATION_JSON, APPLICATION_XML })
	public Response getActor(@Context HttpHeaders headers, @PathParam("type") String type,
			@PathParam("keyName") String keyName, @PathParam("keyValue") String keyValue) {
		String actor;

		try {
			actor = apiService.get(type, keyName, keyValue);
		} catch (Exception e) {
			return error(e);
		}

		return ok(actor);
	}

	@POST
	@Path("person")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes({ MediaType.APPLICATION_JSON })
	public Response createPerson(Person person) {

		try {
			apiService.insertPerson(person);
			
		} catch (Exception e) {
			return error(e);
		}

		return ok();
	}

	@GET
	@Path("person/{id}")
	@Produces({ APPLICATION_JSON, APPLICATION_XML })
	public Response getPerson(@Context HttpHeaders headers, @PathParam("id") String id) {

		try {			
			return ok(apiService.getPerson(id));

		} catch (Exception e) {
			return error(e);
		}
	}

}
