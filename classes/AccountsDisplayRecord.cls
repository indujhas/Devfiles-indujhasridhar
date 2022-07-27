public class AccountsDisplayRecord {
    @AuraEnabled
           public static Integer TotalRecords(){
               return [Select count() from Account];
           }
           @AuraEnabled(cacheable=true)
           public static List<Account> getAccountList(Integer v_Offset, Integer v_pagesize){ 
               return [Select Id,Name,Rating,Industry,Phone from Account limit :v_pagesize OFFSET :v_Offset];
           }
        @AuraEnabled(cacheable=true)
        public static List<Contact> retrieveContactData(string keySearch){       
            
            List<Contact> contactList = [Select Name,Email,Phone  From Contact Where Account.Name=:keySearch];
            return contactList;
        }
       @AuraEnabled(cacheable=true)
        public static List<Contact> relatedContact(Id accountid)
        {
            list<Contact> con1= [Select Name,Email,Phone from Contact where AccountId=:accountid];
            return con1;
        }
    
           @AuraEnabled(cacheable=true)
           public static Integer getNext(Integer v_Offset, Integer v_pagesize){
               v_Offset += v_pagesize;
               return v_Offset;
           }
           @AuraEnabled(cacheable=true)
           public static Integer getPrevious(Integer v_Offset, Integer v_pagesize){
               v_Offset -= v_pagesize;
               return v_Offset;
           }
    
    }