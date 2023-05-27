public with sharing class GetEndDateByCountingOnlyBusinessDays {
    /**
    * @author : Mischael Ganse
    * @date : 27/05/2023
    * @description : Given the startDate and the duration in days, this function returned the endDate
    *  by considering only the business days in the count
    * @param
    */
    public static Date getEndDateByCountingOnlyBusinessDays(Date startDate, Decimal duration){
        System.debug('MG inside getEndDateByCountingOnlyBusinessDays startDate : '+ startDate + ' duration : '+duration);
        // Assuming that we don't know the exact endDate, we want to determine it
        Date endDate;
        // Create a time to set the hour of startDate to the mid Day
        Time dateT = Time.newInstance(12, 0, 0, 0);
        // Convert the startDate type from Date to DateTime with the mid day hour
        Datetime startDateTime = DateTime.newInstance(startDate, dateT);
        DateTime endDateTime;
        if(duration > 0) {
            // if the start date is on sunday, we move it to the next Monday
            if (startDateTime.format('E') == 'Sun'){
                // I move ahead of two days
                startDateTime = startDateTime.addDays(1);
                // if the start date is on saturday, we move it to the next Monday
            } else if (startDateTime.format('E') == 'Sat'){
                // I move ahead of two days
                startDateTime = startDateTime.addDays(2);
            }
            // Initialize the endDateTime to the startDateTime
            endDateTime = startDateTime;
            if(duration == 1){
                endDateTime = startDateTime;
            } else {
                while (duration > 0) {
                    System.debug ('MG iteration : '+ duration);
                    System.debug ('MG current endDateTime :'+ endDateTime);
                    System.debug('endDateTime.format(E) : '+endDateTime.format('E'));
                    // I start decrementing the duration variable
                    duration = duration - 1;
                    if(endDateTime.format('E') == 'Sun') {
                        // I move ahead of one day, to come to the next Monday
                        endDateTime = endDateTime.addDays(1);
                        // Increment this variable to not count the iteration for saturday
                        duration = duration + 1;
                    } else if(endDateTime.format('E') == 'Sat') {
                        // I move ahead of two days, to skipe Sundays
                        endDateTime = endDateTime.addDays(1);
                        // Increment this variable to not count the iteration for saturday
                        duration = duration + 1;
                    } else if (endDateTime.format('E') == 'Mon' && duration > 0){
                        // I move ahead of one day
                        endDateTime = endDateTime.addDays(1);
                    } else if (endDateTime.format('E') == 'Tue' && duration > 0){
                        // I move ahead of one day
                        endDateTime = endDateTime.addDays(1);
                    } else if (endDateTime.format('E') == 'Wed' && duration > 0){
                        // I move ahead of one day
                        endDateTime = endDateTime.addDays(1);
                    } else if (endDateTime.format('E') == 'Thu' && duration > 0){
                        // I move ahead of one day
                        endDateTime = endDateTime.addDays(1);
                    } else if (endDateTime.format('E') == 'Fri' && duration >=1){
                        // I move ahead of one day
                        endDateTime = endDateTime.addDays(3);
                    }
                } 
            }
            
            System.debug('MG inside getEndDateByCountingOnlyBusinessDays returned endDateTime : '+ endDateTime);
            endDate = Date.newinstance(endDateTime.year(), endDateTime.month(), endDateTime.day());
            System.debug('MG inside getEndDateByCountingOnlyBusinessDays returned endDate : '+ endDate);
        }
        return endDate;
    }
}