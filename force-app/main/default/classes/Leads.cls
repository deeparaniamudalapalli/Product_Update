public class Leads {
    public static void leadTransfer(){
        List<Lead> lead1=[SELECT id, name FROM Lead WHERE Createddate = Last_N_Days:30 AND OwnerId='0055g00000FVBIxAAP'];
       // List<Lead> ld=new List<Lead>();
        for(Lead L:lead1){
             L.OwnerId='0055g00000FVCaoAAH';
            }
        update lead1;
  }

}