public with sharing class AccountHelper {
    @AuraEnabled(cacheable=true)
        public static List<Account> getAccountList(){
            List<Account> accList = [Select Id, Name, Type, Rating, AnnualRevenue FROM Account ];
            return accList;
        }
 }