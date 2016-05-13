package task;

import org.springframework.stereotype.Component;

import com.inspiring.smarketus.commons.exceptions.SmarketusException;
import com.inspiring.smarketus.task.annotation.Task;
import com.inspiring.smarketus.task.execution.ExecutionContext;

@Component
public class OperationsServiceTask {
	
	 @Task(inputChannel="operation.add")
	    public ExecutionContext add(ExecutionContext context) throws SmarketusException {
		
		 String value1 = (String) context.getParam("value1");
		 String value2 = (String) context.getParam("value2");
		 
		 double total =  Double.parseDouble(value1) + Double.parseDouble(value2);
		 System.out.println("Total Value after adition" + total );  
		 return context;
	 }
	 
	 @Task(inputChannel="operation.subtract")
	    public ExecutionContext subtract(ExecutionContext context) throws SmarketusException {
		
		 String value1 = (String) context.getParam("value1");
		 String value2 = (String) context.getParam("value2");
		 
		 double total =  Double.parseDouble(value1) + Double.parseDouble(value2);
		 System.out.println("Total Value after subtraction" + total );  
		 
		 return context;
	 }	 

}
