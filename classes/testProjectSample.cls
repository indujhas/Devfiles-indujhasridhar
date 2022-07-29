@isTest
public class testProjectSample {
    @testSetup
    static void setup() {
        List<opportunity> testProject = new List<opportunity>();
        for(Integer i=0;i<=2;i++) {
            testProject.add(new Opportunity(Name = 'TestOpp'+i ,
                                       stageName='Closed Won',
                                       CloseDate=Date.today()
                                       ));
        }
        insert testProject;       
    }
    //@isTest static void updateRecord() {}
    @isTest static void testOppRecord(){
       Test.startTest();
       ProjectOpp.getOpportunitylist();
        Opportunity opty = [SELECT Id FROM Opportunity WHERE Name='TestOpp0'];
         opty.stageName='Needs Analysis';
        update opty;
       Test.stopTest();
       System.assertEquals(2, [select count() from opportunity where stageName='Closed Won']);
       System.assertEquals(1, [select count() from opportunity where NOT stageName LIKE '%Closed Won%']);
    }
}