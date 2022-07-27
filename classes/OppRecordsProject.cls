public with sharing class OppRecordsProject {
        @AuraEnabled(cacheable=true)
        public static List<Opportunity> opptListRecords(){
        return [select AccountId, Name, Amount, Probability, StageName, CreatedDate from Opportunity 
                WHERE StageName= 'Closed Won' 
                AND CreatedDate=THIS_MONTH];
            
        }
}