trigger PhoneHandlertrigge on Account (before update,after update) {
    if(trigger.isAfter&&trigger.isUpdate){
        Set<id> accSet = new Set<id>();
    for (Account acc:Trigger.new)
    {
        if(acc.Phone!=Trigger.oldMap.get(acc.id).Phone){
            accSet.add(acc.id);
        }
    }
List<Contact> lstUpdate = new List<Contact>();
List<Contact>lstCon=[Select id,Phone,account.phone From Contact Where AccountId IN:accSet];
for(Contact Con:lstCon){
    Con.Phone=Con.Account.phone;
    lstUpdate.add(Con);
}
if(!lstUpdate.isEmpty()){
    update lstUpdate;
}
    }
}