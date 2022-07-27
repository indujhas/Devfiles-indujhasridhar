public class ContactTrigHandler {
    public void methodtoupdatepc(List <id> clist){                               
        List <Contact> ulist = new List <Contact>();
        List <Contact> contactlist = new List<Contact> ([Select id,name,Primary_Contact__c from Contact where Primary_Contact__c=true and Accountid in:clist]);
        if(contactlist.size()>0) {
            for(Contact cont: contactlist){
                cont.Primary_Contact__c = False;
                ulist.add(cont);
            }
            update ulist;
        }
    }
}