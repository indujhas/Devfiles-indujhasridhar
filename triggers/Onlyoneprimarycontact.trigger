trigger Onlyoneprimarycontact on Contact (before insert, before update, after update) {
    Trigger_Active_Check__c checkforactive = Trigger_Active_Check__c.getValues('First');
    if(checkforactive.isActive__c == true){
        Chandler newcl = new Chandler();
        
        if(trigger.isbefore && trigger.isinsert){
            newcl.Nonewpc(trigger.new);
        }
        
        if(trigger.isAfter && trigger.isInsert){
            newcl.Nonewpc(trigger.new);
        }
    }
}