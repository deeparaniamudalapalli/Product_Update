public with sharing class Policy {
    public static void policyRecord() {
        Account acc=new Account();
        acc.name = 'deepa';
       acc.Amount__c=10001;
        insert acc;
        Policy__c Pl = new Policy__c();
		Pl.name = 'Pl1';
        pl.Account__c = acc.Id;
        Pl.Policy_Type__c = 'Health';
        insert Pl;
        Policy_Line_Item__c PLI = new Policy_Line_Item__c();
        PLI.name = 'PLI1';
        PLI.Policy__c = Pl.Id;
        PLI.Status__c = 'open';
        insert PLI;




    }
}