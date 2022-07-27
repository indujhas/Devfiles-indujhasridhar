public class RecordActCont {
    @AuraEnabled
    public String queryString{get;set;}
    public List<Account> accList{get;set;}
    public RecordActCont(){
        queryString = 'select id';
        for(Schema.FieldSetMember fld :SObjectType.Account.FieldSets.Accountfieldset.getFields()) {
            queryString += ', ' + fld.getFieldPath();
        }
        queryString += ' from Account limit 5';
        
        accList = Database.query(queryString);
    }}