public class ExpenseController {

    @AuraEnabled
     public static List<Expense__c> getExpenses() {
        return [SELECT id, 
        			   name, 
        			   VIC1__amount__c, 
        			   VIC1__client__c, 
        			   VIC1__date__c,
                   	   VIC1__reimbursed__c, 
                   	   createdDate 
                FROM VIC1__Expense__c];
    }
    
    @AuraEnabled
    public static Expense__c saveExpense(Expense__c expense) {
        upsert expense;
        return expense;
    }
    
    
}