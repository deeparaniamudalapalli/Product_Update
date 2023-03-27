trigger AccountUpdatedTrigger on Account (before update,after update) {
    if (trigger.isBefore&&Trigger.isUpdate) {
        for(Account acc:Trigger.new){
            if(acc.Ownerid!=trigger.oldMap.get(acc.id).Ownerid)
            {
                acc.Ownerid.addError('you should not able to change owner');
            }
        }
        
    }
}