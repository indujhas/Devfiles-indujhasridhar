public class myFirstQueable implements Queueable {
    private List<Account> accLst;
    public myFirstQueable(List<Account> lstacc){
        this.accLst = lstacc; 
    }
    public void execute(QueueableContext context){
        List<Contact> newCon =new List<Contact>();
        for(Account acc : accLst){
           Contact con = new Contact();
            con.LastName = acc.Name;
            con.AccountId = acc.id;
            newCon.add(con);
        }
        if(newCon.size()>0){
            insert newCon;
        }
        
    }
}