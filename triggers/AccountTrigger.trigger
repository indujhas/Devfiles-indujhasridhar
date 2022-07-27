trigger AccountTrigger on Account (After insert) {
 
    if(trigger.isInsert && trigger.isAfter){
        system.enqueueJob(new myFirstQueable(trigger.new));
    }
}