trigger changeshippingAdrees on Account (before insert) {
    for(Account  ac : Trigger.new){
        // you should first check user passing null values or not
        if(ac.BillingStreet !=Null){
            ac.ShippingStreet=ac.BillingStreet;
        }
        if(ac.BillingCity!=Null){
            ac.ShippingCity=ac.BillingCity;
        }
        if(ac.BillingState!=Null){
            ac.ShippingState=ac.BillingState;
        }
        if(ac.BillingPostalCode!=Null){
            ac.ShippingPostalCode=ac.BillingPostalCode;
        }
        if(ac.BillingCountry!=Null){
            ac.ShippingCountry=ac.BillingCountry;
        }
}
}