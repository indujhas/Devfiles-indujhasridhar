public class AcctCont {
    @AuraEnabled
    public static Id getData(String AccountName, String Website, String AccountNumber){ 
        Account act = new Account();
        act.Name = AccountName;
        act.AccountNumber = AccountNumber;
        act.Website = Website;
        insert(act);
        Contact cont = new Contact();
        cont.LastName = AccountName;
        cont.AccountId = act.Id;
        cont.Phone = cont.Phone;
        insert(cont);
        return(act.Id);
    }
}