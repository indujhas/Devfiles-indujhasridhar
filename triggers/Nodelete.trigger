trigger Nodelete on Account (before delete) {
    Trigger_Active_Check__c checkforactive = Trigger_Active_Check__c.getValues('First');
    if(checkforactive.isActive__c == true){
        List<Account> alist = new List<Account>();
        Set<id> idlist = new Set<id>();
        for(Account act : Trigger.old)
        {
            idlist.add(act.id);
        }
        
        Map<Id, Account> acc = new Map<Id, Account>([Select Id, (Select Id from contracts) from Account where Id in :idlist]);
        for(Account act: Trigger.old)
        {
            if(acc.get(act.id).contracts.size()>0)
            {
                act.adderror('!! -> You are not authorised to delete this account as it has one/many associated child contracts');
            }
        }
    }
}