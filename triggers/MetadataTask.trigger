trigger MetadataTask on Account (after insert,after update) {
    Trigger_Active_Check__c checkforactive = Trigger_Active_Check__c.getValues('Maptrig');
    if(trigger.isafter && trigger.isinsert) {
        MetadataT.Mapcustobj(trigger.new);
    }
    if(trigger.isafter && trigger.isupdate){
        MetadataT.Mapupdatecustob(trigger.new);
    }
}