package service;

import static model.Client.CPF;

import org.springframework.beans.factory.annotation.Autowired;

import com.inspiring.smarketus.commons.exceptions.SmarketusException;
import com.inspiring.smarketus.commons.system.Actor;
import com.inspiring.smarketus.system.annotations.ActorSync;
import com.inspiring.smarketus.system.services.ActorSyncService;

import model.Client;

@ActorSync(value= "Cliente")
public class ActorSyncClientServiceImpl implements ActorSyncService {
	
	@Autowired
	ClientService clientService;


	@Override
	public void create(Actor actor) throws SmarketusException {
		Client myClient = new Client().buildClient(actor);
		clientService.createClient(myClient);
	}

	@Override
	public void get(Actor actor) throws SmarketusException {
		Client myClient = clientService.getClient(actor.get(CPF));
		myClient.buildActor(actor);
	}

	@Override
	public void update(Actor actor) throws SmarketusException {}

	@Override
	public void delete(Actor actor) throws SmarketusException {}
}
