trigger policy2trigger on Policy__c (before insert , before update) {
    if(trigger.isbefore&&trigger.isInsert)
    {
        List<Policy__c> ply = trigger.new;
             for(Policy__c pl:ply){
            pl.Name=pl.Name  +'updated';
       }
    }

}