public class Assessment {

    @AuraEnabled

    public static List <Account> getAccounts() {

        return [SELECT Id, name, Type, Phone,Industry,Rating FROM Account ORDER BY Industry,Rating ASC];

    }

    @AuraEnabled

    public static List<Account> findByName(String searchKey) {

        String name = + searchKey + '%';

        return [SELECT id, name, phone,type,Industry,Rating FROM Account WHERE name LIKE :name ORDER BY Industry,Rating ASC];

    }   

}