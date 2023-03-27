public class PolicyPhoneHandler {
            //boolean is nothing but checking true/not
            public static void policyAccountIdRetrive (Boolean isafter,Boolean Isupdate,List<Policy__c> plist,Map<Id,Policy__c> pmap){
            Set<id> accids=new Set<id>();
            Set<id>plids=new Set<id>();
                //checking after update is true or not.  
            if(isafter == true && Isupdate == true){
                //checking accountids available in policy or not
                for(Policy__c pc: plist){
                    //checking for new phone and old phone similar or not
                    if(pc.Phone__c !=pmap.get(pc.id).Phone__c){
                        //checking for account id is there in policy or not
                        if(pc.Account__c!= null){
                            accids.add(pc.Account__c);
                            plids.add(pc.id);
                        }
                    }
                }
            
                updateOpportunityPhone(accids, plids);//calling future method here
             }
        }
            @future
            
            public static void updateOpportunityPhone(set<id> accids,Set<id>plids){//taking sets from first method
                List<Opportunity> oppt=new List<Opportunity>();//new list
                List<Opportunity>oplist=[Select Id,Name,Phone__c, AccountId From Opportunity Where AccountId In:accids];//taking query of opportunity where account id is there or not
                List<Policy__c>polist=[Select Id,Name,Phone__c From Policy__c Where Id IN:plids];//taking query of policy where policy id is there or not
                if(oplist.size()>0){//list size is greaterthan or not
                    for(Policy__c pol:polist){
                    for(opportunity opp:Oplist){
                        opp.Phone__c=pol.Phone__c;
                        oppt.add(opp);
                    }
                }
                    update oppt;
                }
            }
            
        }