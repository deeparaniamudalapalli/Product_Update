trigger Policytrigger on Policy__c (before insert , before update,before delete,after insert,after update,after delete,after undelete) {
    PolicyPhoneHandler.policyAccountIdRetrive(Trigger.isafter,Trigger.isupdate,Trigger.new,Trigger.oldmap);
    
/*if(trigger.isbefore && (trigger.isInsert || trigger.isUpdate)){
        List<Policy__c>plcy=trigger.new;
        for(Policy__c p:plcy){
            if(p.Policy_Type__c=='Health' && p.Amountt__c<500)
            {
                p.Policy_Type__c.addError('ploicy type is not health');
            }
        }
    }
    if(trigger.isbefore&&trigger.isInsert)
    {
        List<Policy__c> ply = trigger.new;
             for(Policy__c pl:ply){
            pl.Name=pl.Name  +'updated';
       }
    */
        

}