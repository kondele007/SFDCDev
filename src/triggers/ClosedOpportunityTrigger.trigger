trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
	List<Task> taskList = new List<Task>();
    for(Opportunity opp: Trigger.new){
        if(Trigger.isInsert){
            if(opp.StageName == 'Closed Won'){
                taskList.add(new Task(Subject = 'Follow Up Test Task', WhatId = opp.Id));
            }
        }
        if(Trigger.isUpdate){
            if(opp.StageName == 'Closed Won' && opp.StageName != Trigger.oldmap.get(opp.Id).StageName){
                taskList.add(new Task(Subject = 'Follow Up Test Task', WhatId = opp.Id));
            }
        }
    }
    if(taskList.size() > 0){
        insert taskList;
    }
}