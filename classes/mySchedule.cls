public class mySchedule implements Schedulable {
    public void execute(SchedulableContext sc){
        Database.executeBatch(new firstBatchClass(), 10);
        List<Account> acclist = [Select id, name from Account where createdDate = TODAY];
        for(Account acc : acclist){
            acc.name = 'created today ' +acc.name;
        }
        update acclist;
    }

}