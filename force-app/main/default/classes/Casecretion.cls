public class Casecretion {
   
 public static void closeCase(){
    List<Case> Ca =[SELECT id FROM Case WHERE CreatedDate >2021-01-08T01:02:03Z AND CreatedDate <2022-01-05T01:02:03Z AND OwnerId='0055g00000FVBIxAAP'];
       for(Case cse : Ca)
       {
             
                cse.status = 'closed';    
            
            
           }update Ca;
}
}