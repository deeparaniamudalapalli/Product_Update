trigger RelatedOpportunity on Account (after update) {
    Set<id>accountids=new Set<id>();//for getting ids
    for(Account a:Trigger.new){
        accountids.add(a.id);
    }
    DateTime day30=system.now()-30;//day30 is the date which is 30 days less than today
    List<Opportunity> updatedList = new List<Opportunity>();
    //getting the opportunities whose account has been updated
    List<Opportunity>oppList = [Select Id, AccountId, StageName, CreatedDate, CloseDate from Opportunity where AccountId in :accountIds];
    if(oppList.size()>0){
    for(Opportunity opp:oppList){
        //checking for condition if created date is greater than 30 days from today and stage not equal to close won
        if(opp.CreatedDate > day30 && opp.StageName!='Close Won'){
            opp.StageName='Close Lost';//This is a mandatory field when we update the CloseDate
            opp.CloseDate=system.today();
            updatedList.add(opp);//putting the changed opportunity to separate list to update later
        }
    }
}//checking if the opportunity list which has changed is having records or not
    if(updatedList.size()>0){
        update updatedList;
    }
}