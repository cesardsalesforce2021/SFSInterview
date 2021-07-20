public  class ContactTriggerHelper 
{
    public static void startApprovalProcess(List<Contact> lstContactNew) 
    {
        for(Contact objContact:lstContactNew)
        {
            ContactTriggerHelper.submitAndProcessApprovalRequest(objContact.Id);
        }
        
    }

    public static void submitAndProcessApprovalRequest(String strRecordId) 
    {
           // Create an approval request for  Opportunity        
           Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();          
           req.setComments('Submitting approval request using Trigger');        
           req.setObjectId(strRecordId);
           // Submit the approval request for the Opportunity   
           req.setNextApproverIds(new Id[] {UserInfo.getUserId()});     
           Approval.ProcessResult result = Approval.process(req); 
    }

    public static void ProcessSummary( List<Contact> lstContactNew) 
    {
        Map<String,Integer> mapAcc= new Map<String,Integer>();

        Set<Id> setIds= new Set<Id>();

        List<Account> lstAcctoUpdate=new List<Account>();

        for(Contact objContact:lstContactNew)
        {
            if(objContact.AccountId<>null)
            {
                setIds.add(objContact.AccountId);
            }
            
            
        }
        List<Contact> lstCC= [Select Id,Name,AccountId from Contact where AccountId in : setIds and IsDeleted=False and Active__c=True];

        for(Contact objContact:lstCC)
        {
            if(!mapAcc.containsKey(objContact.AccountId))
            {
                mapAcc.put(objContact.AccountId,1);
            }
            else 
            {
                mapAcc.put( objContact.AccountId,mapAcc.get(objContact.AccountId)+1);
            }
        }

        for(String strAccId:setIds)
        {
            if(mapAcc.containsKey(strAccId))
            {
                lstAcctoUpdate.add(new Account(Id=strAccId,Total_Contacts__c=mapAcc.get(strAccId)));
            }
            else 
            {
                lstAcctoUpdate.add(new Account(Id=strAccId,Total_Contacts__c=0));
            }
            
        }
        
        update lstAcctoUpdate;

    }
    
}