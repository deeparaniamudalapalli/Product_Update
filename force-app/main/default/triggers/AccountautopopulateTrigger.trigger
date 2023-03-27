//When contact record is inserted/Updated create account record same should be populate in contact and also create opportunity
//record and tag opportunity to contact and account.
//If name in the contact record updated, update same name in opp and account as well.
trigger AccountautopopulateTrigger on Contact (before insert,after insert,after update) {
    if(trigger.isinsert&&trigger.isbefore||trigger.isafter){
            List<Contact>contlist=new List<Contact>();
            for(Contact cont:Trigger.new){
                if(String.isBlank(cont.AccountId)){
                    contlist.add(cont);
                }
            }
        system.debug('contlist_1 ' + contlist); 
            if(contlist.size()>0){
                List<Account>newacclist=new List<Account>();
                Map<String,Contact>conName=new Map<String,Contact>();
            for(Contact convalues:contlist){
                String accountName=convalues.firstname+' '+convalues.lastname;
                    conName.put(accountname,convalues);
                    Account acct=new Account();
                    acct.Name=accountName;
                    acct.Phone=convalues.MobilePhone;
                    newacclist.add(acct);
                }
                insert newacclist;
                    for(Account acc:newacclist){
                        system.debug('mapContainsKey ' + conName.containsKey(acc.Name));
                        if(conName.containskey(acc.Name)){
                            conName.get(acc.Name).accountId=acc.Id;
                        }
                            
                        }
                        
                    }
                
        if(contlist.size()>0){
            List<Opportunity> newoppolist = new List<Opportunity>();
            Map<String,Contact>conName=new Map<String,Contact>();
            for(Contact convalues : contlist){
                String opportunityName=convalues.FirstName+' '+convalues.LastName;
                conName.put(opportunityName,convalues);
                Opportunity opp=new Opportunity();
                opp.Name=opportunityName;
                opp.Phone__c=convalues.MobilePhone;
                opp.StageName='prospecting';
                opp.CloseDate=Date.newInstance(2023,1,10);
                newoppolist.add(opp);
            }
            insert newoppolist;
        }
            }
    }