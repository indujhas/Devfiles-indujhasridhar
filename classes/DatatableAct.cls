public class DatatableAct {
    @AuraEnabled
    public static list<Account> getAccountsData(){
       List<Account> actlist = [Select Name, Website, Phone, AnnualRevenue FROM Account Order By name];
        return actlist;
    }

}