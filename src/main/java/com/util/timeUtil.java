package com.util;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;
import java.util.Calendar;

/**
 * Created by frank_xiang on 2016/7/5.
 */
public class timeUtil {

    public static Time GetCurrentTime(){
        Calendar c = Calendar.getInstance();
        String hour = String.valueOf(c.get(Calendar.HOUR_OF_DAY));
        String minute = String.valueOf(c.get(Calendar.MINUTE));
        String second = String.valueOf(c.get(Calendar.SECOND));
        String CurrentTime = hour + ':' + minute + ':' + second;
        return Time.valueOf(CurrentTime);

    }

    public static Date GetCurrentDate(){
        Calendar c = Calendar.getInstance();
        String year = String.valueOf(c.get(Calendar.YEAR));
        String month = String.valueOf(c.get(Calendar.MONTH)+1);
        String day = String.valueOf(c.get(Calendar.DAY_OF_MONTH));
        String CurrentDate = year + '-' + month + '-' + day;
        return Date.valueOf(CurrentDate);
    }

    public static String GetCurrentDatetime(){
        return (String.valueOf(GetCurrentDate())+ ' ' + String.valueOf(GetCurrentTime()));
    }

}
