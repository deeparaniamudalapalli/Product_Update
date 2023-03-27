public with sharing class HML {
    public static void emi() {
Integer p=500000;//principal amount
Decimal r=10;
r=r/100/12;
Integer n=20*12;
Decimal emi=(p*r*(1+r).pow(n)/((1+r).pow(n)-1));
System.debug('my monthly EMI is---->' + emi);



    }
}