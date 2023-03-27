public with sharing class getContactRecords {
    public static List<Contact> getContacts() {
        List<Contact> lstcon = [Select id,Name From Contact Limit 14];
        return lstcon;
    }
}