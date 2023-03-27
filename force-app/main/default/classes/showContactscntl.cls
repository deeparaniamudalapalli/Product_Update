public class showContactscntl {
    
    @AuraEnabled
    public  static List <Contact> getContacts() 
    {
        List<Contact> lstcon = [Select Id,Name From Contact Limit 10] ;
        return lstcon;  
    }

    }