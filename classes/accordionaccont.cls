public with sharing class accordionaccont {
@AuraEnabled
public static List<Wrapperclass>showAccounts(){
    List<Account> actList=[Select Id,Name,AnnualRevenue,Phone,(select FirstName,LastName,Phone,Name from contacts) FROM Account Order By name];
    List<Wrapperclass> act=new List<Wrapperclass>();
    for(Account a: actList){
        Wrapperclass wrap=new Wrapperclass();
        wrap.actName=a.Name;
        wrap.actAnnualRevenue=a.AnnualRevenue;
        wrap.actphone=a.Phone;
        wrap.conList=a.contacts;
        act.add(wrap);
    }
    return act;        
}
}