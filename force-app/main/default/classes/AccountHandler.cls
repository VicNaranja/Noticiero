public class AccountHandler {

    	public static Account insertNewAccount(String name)
        {
            Account a = new Account();
            a.Name = name;
            
            try
            {
                insert a;
                return a;
			}
            catch(Exception e)
            {
                return null;
            }
            
        }
}