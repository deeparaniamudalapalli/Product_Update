public class Insertplitem {
        public static void insertPlitem12(){
            List<Policy__c> pslist =[SELECT Id, Name, (SELECT Id , Policy__c , name FROM Police_Line_Items__r) FROM Policy__c];
            List< Policy_Line_Item__c> pn = new  List<Policy_Line_Item__c>();
            for(Policy__c a : pslist){
              if(  a.Police_Line_Items__r.size()==0){
                  Policy_Line_Item__c pl=new Policy_Line_Item__c();
                  pl.Name='deepa';
                  pl.Policy__c=a.id;
                  pn.add(pl);
              }
              
          }
            insert pn;
        }
      }