trigger updarteHandsoffAttsched on Top_X_Designation__c (before insert,before update,before delete,after insert,after update,after undelete) {
   List<Opportunity> listoppUpdate=new List<Opportunity>();
 List<Opportunity> listopp=new List<Opportunity>();
 Set<Id> setOppId=new Set<Id>();
 Set<Id> setOppDelete=new Set<Id>();
 map<id,id> mapDocAttchTrue = new map<id,id>();
 map<id,id> mapDocAttchFalse = new map<id,id>();
 map<id,id> mapDelete = new map<id,id>();
 if(Trigger.isInsert || Trigger.isUpdate){
 for(Top_X_Designation__c ada:Trigger.New){
 if(ada.Document_Attached__c==True && (ada.Type__c=='Handoff' || ada.Type__c=='ContractFlowDown')){
 mapDocAttchTrue.put(ada.Opportunity__c,ada.id);
 setOppId.add(ada.Opportunity__c);
 }
 else
 mapDocAttchFalse.put(ada.Opportunity__c,ada.id);
 setOppId.add(ada.Opportunity__c);
 }
 }
 if(Trigger.isDelete){
 for(Top_X_Designation__c ada:Trigger.old){
 mapDelete.put(ada.Opportunity__c,ada.id);
setOppId.add(ada.Opportunity__c);
 setOppDelete.add(ada.Opportunity__c);
 }
 }
 listopp = [select id,Handoff_Attached__c from Opportunity where id in: setOppId];
 if(listopp.size()>0 && listopp !=null){
 for(Opportunity opp:listopp){
 if(mapDocAttchTrue.containskey(opp.id)){
 opp.Handoff_Attached__c='Yes';
 }
 if(mapDocAttchFalse.containskey(opp.id)){
 opp.Handoff_Attached__c='No';
 }
 listoppUpdate.add(opp);
 }
 }
 if(listoppUpdate.size()>0 && listoppUpdate!=null){
 update listoppUpdate;
 
 }
 }