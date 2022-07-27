public class UserController {
    @AuraEnabled
    public static List<User> getSystemUsers() {
        return [SELECT
                Id
                ,IsActive
                ,FirstName
                ,LastName
                ,Profile.UserLicense.Name
                FROM User
                WHERE Profile.UserLicense.Name LIKE '%Salesforce%'
                ORDER BY FirstName ASC];
    }
    
    @AuraEnabled
    public static void changeUserState(Id user_id, Boolean state) {
        update new User(Id=user_id, IsActive=state);
    }
}