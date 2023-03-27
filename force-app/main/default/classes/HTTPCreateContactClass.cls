public class HTTPCreateContactClass {
   public static void createContact(String strInput)
   {
       HTTP htp= new HTTP();//creating pipeline to third party
       HTTPRequest req=new HTTPRequest();//creating request to pipeline
       req.setEndpoint('https://jsonplaceholder.typicode.com/todos/' +strInput );//end point url for requested data
       req.setMethod('GET');//using get method for getting records from json
       HTTPResponse res=htp.send(req);
       System.debug('test values-----'+res);
       System.debug('test values------'+res.getBody());//for getting body
       JSONWrapper wrapper=(JSONWrapper)JSON.deserialize(res.getBody(),JSONWrapper.class);//
       Policy__c pol=new Policy__c();
       pol.Name=Wrapper.title;
       insert pol;
       
   }
    public class JSONwrapper{//to convert json data into string
        public Integer userid;
        public Integer id;
        public string title;
        public Boolean completed;
    }
       
}