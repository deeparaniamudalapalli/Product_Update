@isTest
public class SQX_ProductMappingBatch_Test {
    static testMethod void batchTest() 
    {
        List<Product2> lstPrd = new List<Product2>();
        for(Integer i=0; i<5 ; i++)
        {
            Product2 prd = new Product2();
            prd.Name ='Name'+i;
            prd.ProductCode = 'Prd'+i;
            lstPrd.add(prd);
        }
        insert lstPrd;
        
        List<SQX_Part__c> lstPrt = new List<SQX_Part__c>();
        for(Integer i=0; i<7 ; i++)
        {
            SQX_Part__c prd = new SQX_Part__c();
            prd.Name ='Name'+i;
            prd.Part_Number__c = 'Prd'+i;
            lstPrt.add(prd);
        }
        insert lstPrt;
 
        Test.startTest();

            SQX_ProductMappingBatch obj = new SQX_ProductMappingBatch();
            DataBase.executeBatch(obj); 
            
        Test.stopTest();
    } 

}