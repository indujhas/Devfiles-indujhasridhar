public with sharing class Dataact {
    @AuraEnabled
    public static list<Account> fetchaccs()
    {     
        return [Select id,Name,BillingAddress,Website,AnnualRevenue from Account];
    }
    @AuraEnabled
    public static void deleteSelectedaccs(Account acList) {
        delete acList;
    }
}