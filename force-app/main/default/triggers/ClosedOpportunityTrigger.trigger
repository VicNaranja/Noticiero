trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

    List<Task> listaTareasInsertar = new List<Task>();
    for (Opportunity opp : Trigger.New)
    {
        String oldValueStageName = '';
        if (trigger.oldMap != null)
        {
            oldValueStageName = trigger.oldMap.get(opp.Id).stageName;
        }
        
        if ((oldValueStageName == '' && opp.StageName == 'Closed Won') ||
            oldValueStageName != '' && opp.StageName == 'Closed Won' && opp.StageName != oldValueStageName) 
        {
            Task t = new Task();
            t.subject = 'Follow Up Test Task';
            t.WhatId = opp.Id;
            listaTareasInsertar.add(t);
        }
    }
    
    if (!listaTareasInsertar.isEmpty())
    {
        insert listaTareasInsertar;
    }
}