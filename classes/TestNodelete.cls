@isTest
private class TestNodelete {
    @isTest static void TestNodeleteacc() {
        Account act = new Account(Name='Tempo');
        insert act;
        Contract con = new Contract(Name=act.Name,
                                    Status='Draft',
                                    StartDate=System.today(),ContractTerm=6,
                                    AccountId=act.Id);
        insert con;
        Test.startTest();
        Database.DeleteResult preview = Database.delete(act, false);
        Test.stopTest();
        System.assert(!preview.isSuccess());
        System.assert(preview.getErrors().size() > 0);
        System.assertEquals('!! -> You are not authorised to delete this account as it has one/many associated child contracts',
                            preview.getErrors()[0].getMessage());
    }
    
    @isTest static void TestNodeleteaccnocon() {
        Account act = new Account(Name = 'Serial');
        insert act;
        Test.startTest();
        Database.DeleteResult preview = Database.delete(act,false);
        Test.stopTest();
        System.assert(preview.isSuccess());
    }
}