public class ContactListController {
     @auraEnabled
    public static List<Contact> getContactList(String accountid){
        return [select id,email, phone,lastname,firstname from Contact where accountid=:accountid];
    }
    @auraEnabled
    public static Contact createContacts(Contact con,Id accId)
    {
        con.AccountId=accId;
        insert con;
        return con;
    }
}