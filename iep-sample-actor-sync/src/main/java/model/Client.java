package model;

import com.inspiring.smarketus.commons.system.Actor;

public class Client {

	public static final String CPF = "cpf";
	public static final String NAME = "name";
	public static final String CITY = "city";

	private String cpf;
	private String name;
	private String city;

	public Client buildClient(Actor actor) {
		this.cpf = actor.get(CPF);
		this.name = actor.get(NAME);
		this.city = actor.get(CITY);

		return this;
	}

	public void buildActor(Actor actor) {
		actor.set(CPF, this.cpf);
		actor.set(NAME, this.name);
		actor.set(CITY, this.city);
	}

}