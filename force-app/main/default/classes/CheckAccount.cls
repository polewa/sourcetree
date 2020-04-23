@RestResource(urlMapping='/showAccountsDetails/*')
global class CheckAccount {
    
    @HttpGet
    global static List<Account> getAccount() {
        RestResponse res = RestContext.response;
        RestRequest req = RestContext.request;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        System.debug('Account Id: ' + accountId);
        List<Account> result = [SELECT Id, Name, Website FROM Account WHERE Id =: accountId];
        return result;
    }

    @HttpPost
    global static String doPost(String name, String phone, String accountNumber) {
        Account acc = new Account();
        acc.Name = name;
        acc.Phone = phone;
        acc.AccountNumber = accountNumber;
        insert acc;
        return acc.Id;
    }
}
