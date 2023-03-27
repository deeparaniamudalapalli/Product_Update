//Insert the account record by receiving the input parameters
    public class Demo1 {
    public static void createAccount(String Name,String Phone){
        Account acc=new Account();
        acc.Name= Name;
        acc.Phone= Phone;
        insert acc;
        System.debug('Accountinserted---->'+acc.Name);
        System.debug('Accountinserted----->'+acc.Phone);
    }

}