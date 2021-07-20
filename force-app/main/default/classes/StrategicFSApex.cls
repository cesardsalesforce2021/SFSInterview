/* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* .
* SFS
* Controller class
* Interview
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author Cesar D 
* @modifiedBy    
* @maintainedBy   
* @version        1.0
* @created        June 2021
* @modified       Under Construction
* @see            
* Use Case #:Salesforce Test
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @changes
* vX.X            
* YYYY-MM-DD      
*                 
*
* vX.X            
* YYYY-MM-DD     
*                 
*                 
* ─────────────────────────────────────────────────────────────────────────────────────────────────┘
*/
public class StrategicFSApex {

	@AuraEnabled
	public Integer id {get;set;} 
	@AuraEnabled
	public String creditorName {get;set;} 
	@AuraEnabled
	public String firstName {get;set;} 
	@AuraEnabled
	public String lastName {get;set;} 
	@AuraEnabled
	public Double minPaymentPercentage {get;set;} 
	@AuraEnabled
	public Double balance {get;set;} 
	//Method use to parse the Json response coming from the API call.
	public StrategicFSApex(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'id') {
						id = parser.getIntegerValue();
					} else if (text == 'creditorName') {
						creditorName = parser.getText();
					} else if (text == 'firstName') {
						firstName = parser.getText();
					} else if (text == 'lastName') {
						lastName = parser.getText();
					} else if (text == 'minPaymentPercentage') {
						minPaymentPercentage = parser.getDoubleValue();
					} else if (text == 'balance') {
						balance = parser.getDoubleValue();
					} else {
						System.debug(LoggingLevel.WARN, 'StrategicFSApex consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	
	
	public static List<StrategicFSApex> parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return arrayOfStrategicFSApex(parser);
	}
	
	public static void consumeObject(System.JSONParser parser) {
		Integer depth = 0;
		do {
			System.JSONToken curr = parser.getCurrentToken();
			if (curr == System.JSONToken.START_OBJECT || 
				curr == System.JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == System.JSONToken.END_OBJECT ||
				curr == System.JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}
	



    private static List<StrategicFSApex> arrayOfStrategicFSApex(System.JSONParser p) {
        List<StrategicFSApex> res = new List<StrategicFSApex>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new StrategicFSApex(p));
        }
        return res;
    }



}