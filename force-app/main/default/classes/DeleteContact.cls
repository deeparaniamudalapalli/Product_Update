public class DeleteContact {
    public static void deleteChildrecord(){
        //List<Account>acc1list=[SELECT Id,name FROM Account];
         List<Contact>Con1=[SELECT Id,name ,AccountId FROM Contact WHERE AccountId=Null];
            delete (+Con1);
        System.debug('Child record is deleted--->'+Con1);
        }
    }