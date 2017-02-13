trigger AccountAddressTrigger on Account (before insert, before update) {
    for(Account acc: Trigger.New){
        if(acc.Match_Billing_Address__c == TRUE){
        	//update Account
            acc.ShippingPostalCode = acc.BillingPostalCode;
        }
    }
}