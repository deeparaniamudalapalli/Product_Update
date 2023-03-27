public with sharing class PolicyLineItems {
        public static void lineItemsInPolicy(){
            List<Policy__c> PList = new List<Policy__c>();
            for(Integer i=0; i<9; i++)
            {
               Policy__c P = new Policy__c();
               P.Name= 'Mahesh'+ i;
               PList.add(P);
            }
           insert PList;
          List<Policy_Line_Item__c> PlList = new List<Policy_Line_Item__c>();
                for (Policy__c P : PList)
                {
               Policy_Line_Item__c Pl = new Policy_Line_Item__c();
               Pl.Name= 'Deepa';
               Pl.Policy__c= P.Id;
                PlList.add(Pl);
            }   
            insert PlList;
        }
    
    }