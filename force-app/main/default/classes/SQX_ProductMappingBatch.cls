global class SQX_ProductMappingBatch Implements Database.Batchable<Sobject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC) { 
        
        String query = 'SELECT Id,Name,Part_Number__c,Active__c, Product__c FROM SQX_Part__c Where Product__c = null';
        return Database.getQueryLocator(query);
    } 
    
    global void execute(Database.BatchableContext BC, List<SQX_Part__c> scope) {
        
        Set<String> setPartNum = new Set<String>();
        Map<String,Id> prdMapMain = new Map<String,Id>();
        List<Product2> lstPrdInsert = new List<Product2>();
        List<SQX_Part__c> lstPrtUpdate = new List<SQX_Part__c>();
        
        for(SQX_Part__c prt : scope) {
            setPartNum.add(prt.Part_Number__c);
        }
        
        prdMapMain = getProductRecords(setPartNum);
        
        for(SQX_Part__c prt : scope) {
            if(prdMapMain.get(prt.Part_Number__c) == null) {
                Product2 prdRec = new Product2();
                prdRec.Name = prt.Name;
                prdRec.ProductCode = prt.Part_Number__c;
                prdRec.IsActive = true;
                lstPrdInsert.add(prdRec);
            }
        }
        
        If(!lstPrdInsert.isempty()) {
            insert lstPrdInsert;
        }
        
        prdMapMain = getProductRecords(setPartNum);
        
        for(SQX_Part__c prt : scope) {
            if(prdMapMain.get(prt.Part_Number__c) != null) {
                prt.Product__c = prdMapMain.get(prt.Part_Number__c);
                lstPrtUpdate.add(prt);
            }
        }
        
        if(!lstPrtUpdate.isEmpty()) {
            update lstPrtUpdate;  
        }
        
    }
    
    global void finish(Database.BatchableContext BC) {
    }
    
    public  Map<String,Id> getProductRecords(Set<String> setPartNum){
        Map<String,Id> prdMap = new Map<String,Id>();
        List<Product2> lstProd = [Select Id,Name,ProductCode FROM Product2 Where ProductCode IN : setPartNum];
        for(Product2 prd : lstProd) {
            prdMap.put(prd.ProductCode,prd.Id);
        }
        return prdMap;  
    }
}