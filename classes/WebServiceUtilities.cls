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
public class WebServiceUtilities 
{
    //Class design for making call out to external API, reusable all accross the org
    public static outputRequest makeCallout(inputRequest objinputRequest)
    {
        outputRequest objResponse= new outputRequest();
        HttpRequest inputreq = new HttpRequest();
        inputreq.setEndpoint(objinputRequest.strEndpoint);
        inputreq.setMethod(objinputRequest.strMethod);
        
        if(objinputRequest.strbody<>null)
        {
            inputreq.setBody(objinputRequest.strbody);
        }
        
        inputreq.setTimeout(120000);
        
        for(String strKey:objinputRequest.mapHeaders.keySet())
        {
            inputreq.setHeader(strKey,objinputRequest.mapHeaders.get(strKey));
        }
        
        Http httpCaller = new Http();
        
        HTTPResponse outputres = null;
        try {


            outputres = httpCaller.send(inputreq);
            System.debug('WebServiceUtilities 51: '+inputreq.getEndpoint());
            System.debug('WebServiceUtilities 54: '+outputres.getBody());
            objResponse.strbody=outputres.getBody();
            objResponse.strXmlStreamReader=outputres.getXmlStreamReader();
            objResponse.strStatus=outputres.getStatus();
            objResponse.strStatusCode=String.ValueOf(outputres.getStatusCode());
            objResponse.strToString=outputres.ToString();
        } 
        
        catch (System.CalloutException e) 
        {
            objResponse.strStatusCode=+e.getStackTraceString();
            objResponse.strbody=e.getMessage();
            System.debug('WebServiceUtilities 58: '+e.getMessage());
            System.debug('WebServiceUtilities 59: '+e.getLineNumber());
            System.debug('WebServiceUtilities 59a: '+e.getCause());
            System.debug('WebServiceUtilities 59b: '+e.getStackTraceString());
            System.debug('WebServiceUtilities 59c: '+e.getTypeName());
        }
        System.debug('WebServiceUtilities 60: '+inputreq);
        System.debug('WebServiceUtilities 61: '+outputres);
        return objResponse;
    }

    
    public static WebServiceCallout__mdt getCustomMetadataWS(String strClassName)
    {
        WebServiceCallout__mdt objWebServiceCallout=[ SELECT CalloutN1__c,DeveloperName,endpoint__c,Id,Key__c,
                                                     Label,Language,MasterLabel,NamespacePrefix,Password__c,QualifiedApiName,
                                                     Token__c FROM WebServiceCallout__mdt where Label=:strClassName];
        
        return objWebServiceCallout;
        
        
    }
    
    public class inputRequest
    {
        public String strUserName{get;set;}
        public String strPassword{get;set;}
        public String strToken{get;set;}
        public String strEndpoint{get;set;}
        public String strMethod{get;set;}
        public Map<String, String> mapHeaders= new Map<String, String>();
        public Integer intTimeout{get;set;}
        public Dom.Document document{get;set;}
        public Blob blobBody{get;set;}
        public String strbody{get;set;}
        
    }
    
    public class outputRequest
    {
        
        public String strbody{get;set;}
        public System.XmlStreamReader strXmlStreamReader{get;set;}
        public String strStatus{get;set;}
        public String strStatusCode{get;set;}
        public String strToString{get;set;}        
    }
}