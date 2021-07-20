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
public  class SkeduloInterview_Ctrl 
{
    public SkeduloInterview_Ctrl() 
    {

    }
    //Method invoked from helper controller to fetch data for the table.
    @AuraEnabled
    public static  List<To_Do__c> GetDataBackEnd(String strAccId)
    {
        List<To_Do__c> lstResponse;
        
        lstResponse=[SELECT Actions__c,Contact__c,Contact__r.Name,CreatedById,
                        CreatedDate,Id,IsDeleted,LastActivityDate,
                        LastModifiedById,LastModifiedDate,LastReferencedDate,
                        LastViewedDate,Name,OwnerId,Status__c,SystemModstamp 
                        FROM To_Do__c];

        System.debug('lstResponse: '+lstResponse);
        
        return lstResponse;
    }

}