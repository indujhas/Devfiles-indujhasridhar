public class AccountTriggerHandler {
     public static boolean isExecute = false ;
    public static void updateOpp(List<Account> newList){
            for(Account acc: newList){
                 isExecute = true;
                 
        if(acc.AnnualRevenue != null){
            
            Opportunity opp =[Select Amount, closeDate, StageName from opportunity where Accountid = : acc.Id];
            opp.Amount = acc.AnnualRevenue;
            update opp;
           
          
        } 
    }
        }
    }