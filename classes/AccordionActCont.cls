public class AccordionActCont {
    @AuraEnabled
    public static List<Account> ActContlist()
    {
        List<Account> accList = [select Id,Name,(select firstname,Phone,lastname,Name from contacts)FROM Account Order By name];
        return accList;
    }
}