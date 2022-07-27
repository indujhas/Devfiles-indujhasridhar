public class AccountPagination {
    public ApexPages.StandardSetController controller {set;get;}
 
    public  List<Contact> getCon(){
        List<Contact> con=(List<Contact>) controller.getRecords();
        return con;
    }
    public AccountPagination (){
        List<Contact> con=[SELECT Name, Phone, Email FROM Contact];
        controller=new Apexpages.StandardSetController(con);
        controller.setPageSize(5);
    }

}