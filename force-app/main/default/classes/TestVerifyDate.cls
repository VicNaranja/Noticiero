@isTest
public class TestVerifyDate {

    @isTest static void testDateMEnor() {

        Date d1 = Date.newInstance(2016, 1, 1);
        Date d2 = Date.newInstance(2015, 1, 1);
        
        VerifyDate.CheckDates(d1,d2);        

    }
    
    @isTest static void testDateMayor() {

        Date d1 = Date.newInstance(2016, 1, 1);
        Date d2 = Date.newInstance(2016, 1, 10);
        
        VerifyDate.CheckDates(d1,d2);        


    }
    
    @isTest static void testDateMayor30Dias() {

       
         Date d1 = Date.newInstance(2016, 1, 1);
        Date d2 = Date.newInstance(2016, 3, 10);
        
        VerifyDate.CheckDates(d1,d2);     

    }

}