//more than one contact creating for account get error message 
trigger ContactTrigger on Contact (before insert,after insert,after update ,after delete) {
   if(trigger.isInsert&&trigger.isBefore){
     Set<id> accId = new Set<id>();
        for(Contact cc : trigger.new) {
            if(cc.AccountId != null) {
                accId.add(cc.AccountId);    
            }      
        }
 Map<Id,Account> mapAccount = new Map<Id,Account> ([SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id IN : accId]);
        for(Contact oCon:trigger.new) {	
            if( oCon.AccountId != null && mapAccount.containsKey(oCon.AccountId) ) {
                Account acc = mapAccount.get(oCon.AccountId);
                if(acc.Contacts.size() > 0 ) {
                    oCon.addError('You cant add more then one contact for this account'); 
                }
            }
        }
    

// existing contact last name matches with new contact name show error message
        if(trigger.isBefore&&Trigger.isInsert){
            Set<Contact> conSet=new Set<Contact>([select id,lastname from Contact]);
            map<String,Contact> duplicateMap=new map<String,Contact>();
        
            //get old records 
            for(Contact con:conSet){
                duplicateMap.put(con.LastName,con);
            }
            //compare old records with records in trigger.new
                for(Contact con:Trigger.new){
                  if(duplicateMap.containsKey(con.LastName)){
                        con.adderror('Name already exists');
                    }
                }
            }
        
// count of contacts in account object  
    Set<Id> aId = new Set<Id>();
    if(Trigger.isInsert){
        System.debug('Insert contact for trigger.new - '+Trigger.New);
        for(Contact opp : Trigger.New){
            aId.add(opp.AccountId);
        }
        List<Account> acc = [select id,count_of_contacts__c from Account where Id in:aId];
        List<Contact> con = [select id from contact where AccountId in :aId];
        
        for(Account a : acc){
            a.count_of_contacts__c=con.size();
        }
        update acc;
        System.debug('Number is '+acc);
    }
    if(Trigger.isDelete){
        System.debug('delete contact for trigger.old - '+Trigger.Old);
        for(Contact opp : Trigger.old){
            aId.add(opp.AccountId);
        }
        List<Account> acc = [select id,count_of_contacts__c from Account where Id in:aId];
        List<Contact> con = [select id from contact where AccountId in :aId];
        
        for(Account a : acc){
            a.count_of_contacts__c=con.size();
            
        }
        update acc;
        System.debug('Number is '+acc);
    }
}
}