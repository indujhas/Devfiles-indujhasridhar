public with sharing class AccController{    
    @AuraEnabled
    public static List<Account>showAccounts(){
        List<Account> accList=[Select Id,Name,AnnualRevenue,Phone,(select FirstName,LastName,Phone from contacts)
                               FROM Account Order By name LIMIT 10];
        return accList;
    }
}