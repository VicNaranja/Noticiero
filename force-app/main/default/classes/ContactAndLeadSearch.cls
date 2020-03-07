public class ContactAndLeadSearch {

    public static List<List<sObject>> searchContactsAndLeads(string p)
    {
        return [FIND :p IN ALL FIELDS RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName)]; 


        
    }
}