public with sharing class ListCreation {
    public static void insertAccount(){
                 List<Account> list1 = new List<Account>();
                      Account a  =new Account();
                        a.name='acc12';
                      list1.add(a);
                      Insert list1;
                List<Contact> list2 = new List<Contact>();
                    for(Integer j=1;j<=20;j++){
                        Contact b =new Contact();
                         b.lastname='test'+j;
                        b.AccountId = a.Id;
                        list2.add(b);
                           Insert b;
                    }
                 List<Account> list3 = new List<Account>();
                      Account c  =new Account();
                        c.name='acc13';
                      list3.add(c);
                      Insert list3;
                List<Contact> list4 = new List<Contact>();
                    for(Integer j=1;j<=20;j++){
                        Contact d=new Contact();
                         d.lastname='group'+j;
                        d.AccountId = c.Id;
                        list4.add(d);
                           Insert d;
                    }
              
        }
        }