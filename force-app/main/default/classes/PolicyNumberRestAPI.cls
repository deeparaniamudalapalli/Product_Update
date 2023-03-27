@RestResource(urlMapping='/test/*')
    global class PolicyNumberRestAPI{
        @HttpGet
        global static Policy__c doGet(){
            RestRequest req=RestContext.request;
            RestResponse res=RestContext.response;
            String plId= req.requestURI.SubString(req.RequestURI.lastIndexOf('/')+1);
             Policy__c Result=[Select id , (Select id,Name From Police_Line_Items__r)From Policy__c Where Policy_Number__c =:plId]; 
               return Result;                                   
        }
        @HttpPost
        global static Policy__c doPost(String Name, String Name2){
            Policy__c pl=new Policy__c();
            pl.Name=Name;
            insert pl;
            Policy_Line_Item__c plm=new Policy_Line_Item__c();
            plm.Name=Name2;
            plm.Policy__c=pl.Id;
            insert plm;
            Policy__c Result=[Select id,Name,(Select id,Name From Police_Line_Items__r) From Policy__c Where Id =: pl.Id];
            return Result;
            
        }
        
        
    
    }