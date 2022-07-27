public class VFEmailTemplate {
    public List<Account> getAllAccounts() {
        return [SELECT Name, AnnualRevenue FROM Account
                WHERE AnnualRevenue != null 
                ORDER BY AnnualRevenue 
                DESC LIMIT 10];
    }
    
}