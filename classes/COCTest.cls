@isTest(SeeAllData = false)
private class COCTest {
    static testMethod void TestAccountTriggerMethod(){
        Account Acc = new Account();
        Acc.Name = 'Account 1';        
        insert Acc;
        
        Contact con1 = new Contact();
        Con1.lastName = 'con1';
        con1.AccountId = Acc.id;
        
        
        Contact con2 = new Contact();
        Con2.lastName = 'con2';
        con2.AccountId = Acc.id;
        
        Contact con3 = new Contact();
        Con3.lastName = 'con3';
        con3.AccountId = Acc.id;
        
        Test.startTest();
            insert con1;
            insert con2;
            Insert con3;
            delete con1;
        Test.StopTest();
        
    }
}