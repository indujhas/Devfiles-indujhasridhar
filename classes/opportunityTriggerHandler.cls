public class opportunityTriggerHandler {
public static boolean isExecute = false ;
     public static void createAccount(List<Opportunity > opp){
         for(Opportunity opt : opp){
              isExecute = true;
             
             if(opt.Amount != null){
                 Account acc = [Select name , AnnualRevenue from Account where id =: opt.AccountId];
                 acc.AnnualRevenue = opt.Amount;
                 update acc;
               
                
             }
         }
        }
        
    
        
    
}