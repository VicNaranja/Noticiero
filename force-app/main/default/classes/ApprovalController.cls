public class ApprovalController {
    
    public ApprovalController()
    {
        
    }

    public void approved()
    {
        Approval.ProcessWorkitemRequest pwr = new Approval.ProcessWorkitemRequest();
        pwr.setAction('Reject');
        pwr.setComments('Aprobado desde APEX.');
            
        ProcessInstanceWorkitem process = [SELECT Id
                                           FROM ProcessInstanceWorkitem 
                                           WHERE ProcessInstance.TargetObjectId = '001w000001BzCtvAAF'];
            
        pwr.setWorkItemId(process.Id);//Se recupera de ProcessInstanceWorkitem con el id del registro a aprobar
        Approval.ProcessResult result = Approval.process(pwr);  
    }
}