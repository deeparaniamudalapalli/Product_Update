public with sharing class EmiCalculation {
    @AuraEnabled
    public static void emi(Integer p,Integer n,Decimal r) {
        r=r/100/12;
         n=20*12;
        Decimal emi=(p*r*(1+r).pow(n)/((1+r).pow(n)-1));
System.debug('my monthly emi is--->' +emi);

}
}