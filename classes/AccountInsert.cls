@RestResource(urlMapping='/AccountInsert/*')
global with sharing class AccountInsert {

    @HttpDelete
    global static void doDelete() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account account = [SELECT Id FROM Account WHERE Id = :accountId];
        delete account;
    }
  
    @HttpGet
    global static Account doGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account result = [SELECT Id, Name, Phone, Industry, AccountNumber, Site FROM Account WHERE Id = :accountId];
        return result;
    }
  
  @HttpPost
    global static String doPost(String name,
        String phone, String website) {
        Account account = new Account();
        account.Name = name;
        account.Phone = phone;
        account.website = website;    
        insert account;
        return account.Id;
    }
    @HttpPut
    global static Account doPutMethod(String Name, Integer AnnualRevenue){
    Map<String,String> paramsMap = RestContext.request.params;
    String accid=paramsMap.get('id');
     Account acc= new Account(Name =name, AnnualRevenue = annualrevenue, Id =accid);
    update acc;
    return acc;
    }

}