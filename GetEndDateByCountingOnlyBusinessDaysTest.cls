/**
* @author : Mischael Ganse
* @date : 27/05/2023
* @description : Class test for the apex class DateClass
* @param
*/
@istest(SeeAllData=false)
public without sharing class GetEndDateByCountingOnlyBusinessDaysTest {
    @istest
    public static void getEndDateByCountingOnlyBusinessDaysTest(){
        Test.startTest();
        Decimal duration = 1.0;
        // End date is Saturday
        Date startDateOneDay = Date.newInstance(2021, 10, 02);
        Date endDateOneDay = GetEndDateByCountingOnlyBusinessDays.getEndDateByCountingOnlyBusinessDays(startDateOneDay, duration);
        
        duration = 15.0;
        // Start date is Saturday
        Date startDateSaturday = Date.newInstance(2021, 10, 02);
        Date endDateSaturday = GetEndDateByCountingOnlyBusinessDays.getEndDateByCountingOnlyBusinessDays(startDateSaturday, duration);
        
        //Start date is Sunday
        Date startDateSunday = Date.newInstance(2021, 10, 03);
        Date endDateSunday = GetEndDateByCountingOnlyBusinessDays.getEndDateByCountingOnlyBusinessDays(startDateSunday, duration);
        Test.stopTest();
    }
}