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
public  class SFSInterview 
{
    public SFSInterview() 
    {

    }
    //Method invoked from helper controller to fetch data for the table.
    @AuraEnabled
    public static  List<StrategicFSApex> GetDataBackEnd(String strAccId)
    {
        List<StrategicFSApex> lstResponse;
        
        lstResponse= StrategicFSApex.parse(SFSInterviewCallOut.GetDataAPI());

        System.debug('lstResponse: '+lstResponse);
        
        return lstResponse;
    }

}