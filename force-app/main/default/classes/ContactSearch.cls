public class ContactSearch {

    public static List<Contact> searchForContacts(String name, String postalCode)
    {
        return [select Id,Name from Contact where LastName = :name and MailingPostalCode = :postalCode];
    }
}