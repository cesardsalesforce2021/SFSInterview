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
public class SFSInterviewCallOut 
{
    //Method design to use the webservice utility to make a external call out.
    public static String GetDataAPI()
    {
        WebServiceUtilities.inputRequest varInput= new WebServiceUtilities.inputRequest();
        WebServiceCallout__mdt objWebServiceCallout = WebServiceUtilities.getCustomMetadataWS('SFSInterviewCallOut');
        
        varInput.strEndpoint = objWebServiceCallout.endpoint__c+objWebServiceCallout.CalloutN1__c;
        varInput.strMethod='GET';
        
       
        
        WebServiceUtilities.outputRequest varOutPut=WebServiceUtilities.makeCallout(varInput);
        
        system.debug('varInput: '+varInput);
        
        system.debug('varOutPut: '+varOutPut);
        
        return varOutPut.strbody;
    }
}