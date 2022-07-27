trigger opptrigger on Opportunity (After Update) {
    if(opportunityTriggerHandler.isExecute == false){
      
        opportunityTriggerHandler.createAccount(trigger.new);
    }
    
}