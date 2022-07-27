public class MetadataT {    
    public static void Mapcustobj(List<Account> ObjAct){
        List<Contact> count = new List<Contact>();
        List<id> actid = new List<id>();
        for(Account at:ObjAct){
            actid.add(at.id);
        }
        Map<String,String> mapcustob = new Map<String,String>();
        List<Map_Data__mdt> cm =  new List<Map_Data__mdt> ([SELECT Destination_Field__r.QualifiedAPIName, Destination_Object__c, Source_Field__r.QualifiedAPIName, Source_Object__c
                                                            FROM Map_Data__mdt WHERE Source_Field__c!= NULL]);
        system.debug(cm);
        for(Map_Data__mdt amdt: cm){
            mapcustob.put(amdt.Destination_Field__r.QualifiedAPIName,amdt.Source_Field__r.QualifiedAPIName);
            system.debug(mapcustob);
        }
        for(Account at:ObjAct){
            Contact cont = new Contact();
            for(String mdta:mapcustob.keyset()){
                cont.AccountId = at.Id;
                cont.LastName = at.Name;
                cont.put(mdta,at.get(mapcustob.get(mdta)));
                system.debug(cont);
            }
            count.add(cont); 
        }
        insert count;  
    }
    public static void Mapupdatecustob(List<Account> ObjAct){
        List<Contact> contt = new List<Contact>();
        List<id> actid = new List<id>();
        for(Account at:ObjAct){
            //if(at.id != null && at.Contacts.size()>0){
            actid.add(at.id); 
        }   
        //}
        
        Map<String,String> mapcustob = new Map<String,String>();
        List<Map_Data__mdt> cm =  new List<Map_Data__mdt> ([SELECT Destination_Field__r.QualifiedAPIName, Destination_Object__c, Source_Field__r.QualifiedAPIName, Source_Object__c
                                                            FROM Map_Data__mdt WHERE Source_Field__c!= NULL]);
        
        for(Map_Data__mdt amdt: cm){
            mapcustob.put(amdt.Destination_Field__r.QualifiedAPIName,amdt.Source_Field__r.QualifiedAPIName);
            
        }
        List <Contact> countc = new List<Contact>([SELECT id, LastName, AccountId from Contact WHERE AccountId in: actid]);
        for(Account at:ObjAct){
            for(Contact ch:countc){
                if(at.id == ch.AccountId){
                    for(String mdta:mapcustob.keyset()){
                        ch.put(mdta,at.get(mapcustob.get(mdta)));
                    }
                }
                contt.add(ch);
            }
        }
        update contt;
    }
}