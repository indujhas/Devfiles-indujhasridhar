public class firstBatchClass implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select id, name from Account');
        
    }
    public void execute(Database.BatchableContext bc, list<Account> listAcc){
        for(Account acc : listAcc){
            acc.name = 'updated by batch ' + acc.Name;
        }
        update listAcc;
        
    }
    public void finish(Database.BatchableContext bc){
        system.debug('Job Done');
        
    }
}