/**
 * 工具类
 */

 class Util {
   // 获取两天后是周几
   static String getWeekDay(){
     var now = new DateTime.now();
     var sixtydaysFromsNow = now.add(new Duration(days: 2));
     switch(sixtydaysFromsNow.weekday){
       case 1:
         return '周一';
       case 2:
         return '周二';
       case 3:
         return '周三';
       case 4:
         return '周四';
       case 5:
         return '周五';
       case 6:
         return '周六';
       case 7:
         return '周日';
     }
     return null;
   }
 }
