trigger newTrigger on Account (before insert) {
    for(Account acc : trigger.new){
        acc.AnnualRevenue = 50000;
        system.debug(acc);
    }
}