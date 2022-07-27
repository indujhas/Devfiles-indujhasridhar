public class ContactVf {
    public List<Contact> lstcon{
        get;
        set;
    }
    public ContactVf(){
        
    lstcon = [Select id, name, phone, Email from Contact Limit 20];
    }
}