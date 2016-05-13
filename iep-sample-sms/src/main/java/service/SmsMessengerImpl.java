package service;

import org.springframework.stereotype.Component;

import com.inspiring.iep.message.beans.SmsMessage;
import com.inspiring.iep.message.messenger.SmsMessenger;
import com.inspiring.smarketus.commons.exceptions.SmarketusException;

@Component("Sms Sender")
public class SmsMessengerImpl implements SmsMessenger {

	@Override
	public void send(SmsMessage message) throws SmarketusException {

		message.getOriginator(); // Remetente
		message.getRecipients(); // Lista de destinatários
		message.getText(); // Mensagem a ser enviada
		message.getGateway(); // Dados do serviço de gateway
	}

}
