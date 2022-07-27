public class Parentchildgchandler {
    public void updatesubinc(List<Parent__c> plist){
        List<id> pid = new List<id>();
        for(Parent__c par:plist){
            if(par.Status__c=='In Progress'){
                pid.add(par.id);
            }
            List<Child__c> clist = [Select id,Subject__c, Parent__r.Subject__c, Parent__r.Status__c from Child__c where Parent__c =:plist];
            
            List<Child__c> childlist = new List<Child__c>();
            Child__c cr = new Child__c();
            for(Child__c crec:clist){
                if(crec.Parent__r.Status__c == 'In Progress'){
                    cr = new Child__c();
                    cr.id = crec.id;
                    cr.Subject__c = crec.Parent__r.Subject__c;
                    childlist.add(cr);
                }
                
                update childlist;	
                        
            Set<String> gchild = new Set<String>();
            for(Child__c chi:clist){
                gchild.add(chi.id);
            }
            
            List<Grandchild__c> grandchildlist = new List<Grandchild__c>();
            List<Grandchild__c> glist = [Select id,Subject__c,Child__r.Subject__c from Grandchild__c where Child__c in:gchild];
            Grandchild__c grecord = New Grandchild__c();
            
            
                for(Grandchild__c grec:glist){
                    if(crec.id == grec.Child__c){
                        grecord = new Grandchild__c();
                        grecord.id=grec.id;
                        grecord.Subject__c = crec.Parent__r.Subject__c;
                        grandchildlist.add(grecord);
                    }
                    update grandchildlist;
                }
            }
        }
    }
}