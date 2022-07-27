public class Paginationact {
    @AuraEnabled
    public static List<Account> GetAccount()
    {
        List<Account> lstAccount=[Select Id,Name,Phone,SLAExpirationDate__c FROM Account];
        return lstAccount;
    } 
    @AuraEnabled
    public static List<Account> getbydate(Integer searchkey){      
        return [Select Id,Name,Phone,SLAExpirationDate__c from Account where CALENDAR_YEAR(SLAExpirationDate__c)=:searchkey];       
    }        
}