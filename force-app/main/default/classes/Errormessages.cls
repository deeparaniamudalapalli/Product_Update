public with sharing class Errormessages {
        public static void errorLog() {
        try{
        Account acclist=[SELECT Id, name,Phone FROM Account];
        List<Contact> Con = [SELECT Id, Account.Phone FROM Contact];
        list<Contact> Conlist =new list<Contact>();
            for(Contact c : Con){
                c.Phone = c.Account.Phone ;
                Conlist.add(c);
            }

        if( Conlist != Null && !Conlist.isEmpty())
        {
            update +Conlist;
        }
        }
        catch(Exception e){
            Error_Log__c elog = new Error_Log__c();
            if(e != Null){
              elog.Name='nani';
            elog.Error__c= e.getMessage();                                                                                
                                       }
            insert elog;
                Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
          message.toAddresses = new String[] { 'deeparaniamudalapalli12@gmail.com' };
                                      }
                                    }
                                  }