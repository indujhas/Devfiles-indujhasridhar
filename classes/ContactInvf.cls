public class ContactInvf {
   public List<SelectOption> lstOptions {get;set;}
    public String selectedAccount {get; set;}
    public List<Contact> lstContacts {get; set;}
    
    public ContactInvf() 
    {
         List<Account> lstAccounts = [Select id, name from account order by name];
         lstOptions = new List<SelectOption>();
         if(!lstAccounts.isEmpty())
         {
             lstOptions.add(new SelectOption('','.....NONE.....'));
             for(Account acc : lstAccounts)
             {
                 lstOptions.add(new SelectOption(acc.id, acc.name));
             }
         }
    }
    
    public PageReference LoadContacts()
    {
        lstContacts = [select id, firstName, lastName, phone from contact where accountId = : selectedAccount];
        return null;
    }
}