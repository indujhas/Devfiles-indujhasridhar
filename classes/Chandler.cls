public class Chandler {
    public void Nonewpc(List<contact> Clist){
        List<id> accid = new List<id>();
        Map<String,Set<String>> accprimarymap = new Map<String,Set<String>>();
        Set<id> cid = new Set<id>();
        for(Contact c: Clist){
            if(c.Accountid!=null && c.Primary_Contact__c==true){
                accid.add(c.accountid);
                cid.add(c.Id);
            }
        }   
        List<Contact> conList = [Select id,name,Primary_Contact__c from Contact where Primary_Contact__c=true and Accountid in:accid and Id not in:cid];
        for(Contact c: Clist){
                if(c.AccountId!=null){
                    if(!accprimarymap.containsKey(c.AccountId)){
                        if(c.Primary_Contact__c){
                            Set<String> coId = new Set<String>();
                        	coId.add(c.Id);
                        	accprimarymap.put(c.AccountId,coId);
                        }
                        
                    } else{
                        if(c.Primary_Contact__c){
                            Set<String> coId = accprimarymap.get(c.AccountId);
                            coId.add(c.Id);
                           accprimarymap.put(c.AccountId,coId);
                        }
                    }
            }
        }
        
        if(conList == null || conList.isEmpty()){
            for(Contact con: Clist){
                if(!accprimarymap.containsKey(con.AccountId)){//con2->Acc1,accPrimarymap-> keydoesnotcontain
                    con.addError('Primary checkbox must be true');
                } else{
                    Set<String> primaryConId = accprimarymap.get(con.AccountId);
                    if(primaryConId.size() > 1){
                        con.addError('You cannot make more than one contact primary in asingle transaction');
                    }
                }
            }
        } else{
            Set<String> conIdSet = new Set<String>();
            List<Contact> conListToUpdate = new List<Contact>();
            for(Contact con: Clist){
                if(con.Primary_Contact__c){
                    if(accprimarymap.containsKey(con.AccountId)){
                        Set<String> coId = accprimarymap.get(con.AccountId);
                        if(coId.size() > 1){
                            con.addError('You cannot make more than one contact primary in asingle transaction');
                        } else{
                            for(Contact relCon: conList){
                                conIdSet.add(relCon.Id);
                            }
                        }
                    }
                }
            }
            if(conIdSet.size() > 0){
                List<Contact> cnList = [Select Id,Name,AccountId,Primary_Contact__c from Contact where Id IN: conIdSet];
                for(Contact con: cnList){
                    con.Primary_Contact__c = false;
                    conListToUpdate.add(con);
                }
            }
            if(conListToUpdate.size() > 0){
                update conListToUpdate;
            }
        }
    }
}