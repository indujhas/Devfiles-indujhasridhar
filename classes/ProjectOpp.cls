public class ProjectOpp {
   
    @AuraEnabled
    public static list<opportunity> getOpportunitylist(){
        
        list<opportunity> oppt =new list<opportunity>([select Id, Name, AccountId, Amount, Probability, StageName, CloseDate, CreatedDate from Opportunity WHERE StageName= 'Closed Won' 
                                 AND CreatedDate=THIS_MONTH]);
        return oppt;
    }
}