public with sharing class RelatedRecords {
        public static void multipleRelatedRecords (){
            Policy__c Pl = new Policy__c();
            Pl.name = 'Govind';
            Pl.Policy_Type__c = 'Health';
            Pl.Email__c='deepa@gmail.com';
            insert Pl; 
            Policy_Line_Item__c PLI5 = new Policy_Line_Item__c();
            PLI5.Name = 'Kumari';
            PLI5.Policy__c=Pl.Id;
            PLI5.Status__c='New';
            insert PLI5;
            Policy_Line_Item__c PLI2 = new Policy_Line_Item__c();
            PLI2.Name = 'Gita';
            PLI2.Policy__c=Pl.Id;
            PLI2.Status__c='Closed';
            insert PLI2;
            Policy_Line_Item__c PLI3 = new Policy_Line_Item__c();
            PLI3.Name = 'Ram';
            PLI3.Policy__c=Pl.Id;
            PLI3.Status__c='Open';
            insert PLI3;
        }
    }