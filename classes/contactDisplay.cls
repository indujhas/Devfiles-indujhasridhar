public class contactDisplay {
    @AuraEnabled(cacheable=true)
    public static List<Contact>getContact()
    {
        return [SELECT Id, Name, Email, Phone from Contact];
    }

    }