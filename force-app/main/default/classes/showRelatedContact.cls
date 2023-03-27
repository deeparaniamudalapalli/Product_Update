public class showRelatedContact {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(Id accRecordId)
     {
        List<Contact> lstcon=[Select Id,Name From Contact Where AccountId=:accRecordId];
        System.debug('lstcon--'+lstcon);
        return lstcon;
            
     }
}