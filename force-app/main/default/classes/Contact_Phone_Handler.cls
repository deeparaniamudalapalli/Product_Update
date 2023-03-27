public with sharing class Contact_Phone_Handler {
    public static void Account_Number() {
        List<Account>acclist=[SELECT Id, name,Phone FROM Account];
        List<Contact> Con = [SELECT Id, Account.Phone FROM Contact];
        list<Contact> Conlist =new list<Contact>();
            for(Contact c : Con){
                c.Phone = c.Account.Phone ;
                Conlist.add(c);
            }

        if( Conlist != Null && !Conlist.isEmpty())
        {
            update Conlist;
        }
    }
}