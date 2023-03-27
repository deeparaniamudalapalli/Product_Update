public class AccountBatchClass implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext BC){
      //  Date s = CreatedBy < '2022-10-10' AND CreatedBy <'2022-11-30';
       //String query='Select Id, Name From Account Where CreatedBy=s';
        return Database.getQueryLocator([select Id
            from Account
            where CreatedDate >2022-10-10T01:02:03Z AND CreatedDate >2022-11-30T01:02:03Z ]);
    } 
    public void execute(Database.BatchableContext BC, List<Account> accList){
        if(accList.size() >0){
		delete +(accList);
            }
    }
    public void finish(Database.BatchableContext BC){
        
    }
    }