trigger Updatepcg on Parent__c (after update) {
    Parentchildgchandler pcg = new Parentchildgchandler();    
    if(trigger.isafter && trigger.isupdate){
        pcg.updatesubinc(trigger.new);        
    }
            
    
}