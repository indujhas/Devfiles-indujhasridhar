public class AccDat {
    @AuraEnabled
    public static list<Account> getAccounts(){
       List<Account> actlist = [ Select Id, Name,(select FirstName,LastName,Phone from contacts) FROM Account Order By name LIMIT 20];
        return actlist;
    }

}