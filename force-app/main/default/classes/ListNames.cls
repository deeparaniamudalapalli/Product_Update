public with sharing class ListNames {
    public static void personNames() {
        List<String> names= new List<String> {'srinivas'  , 'manusha','niharika','vamshi','srinivas','naveena','sachin','mahesh','deepa','mounka','sudheer'};
        names.remove(1);
        names.remove(1);
        names.remove(2);
        names.remove(2);
        names.remove(4);
        names.remove(4);
        names.remove(4);
        System.debug(+names);
    }
        public static  void duplicates(){
        Set<String> names = new Set<String>{'srinivas'  , 'manusha','niharika','vamshi','srinivas','naveena','sachin','mahesh','deepa','mounka','sudheer'};
      System.debug(+names) ; 
            
        }

    }