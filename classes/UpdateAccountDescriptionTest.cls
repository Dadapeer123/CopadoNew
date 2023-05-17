@isTest
private class UpdateAccountDescriptionTest {
    @isTest
    static void testUpdateAccountDescription() {
        // Create test data
        Account testAccount = new Account(Name = 'Test Account', Description = 'Old Description');
        insert testAccount;
        
        Contact testContact1 = new Contact(AccountId = testAccount.Id, FirstName = 'John', LastName = 'Doe', Description = 'Contact Description 1');
        Contact testContact2 = new Contact(AccountId = testAccount.Id, FirstName = 'Jane', LastName = 'Smith', Description = 'Contact Description 2');
        Contact testContact3 = new Contact(AccountId = testAccount.Id, FirstName = 'Bob', LastName = 'Johnson', Description = '');
        Contact testContact4 = new Contact(AccountId = testAccount.Id, FirstName = 'Alice', LastName = 'Brown');
        insert new List<Contact>{testContact1, testContact2, testContact3, testContact4};
        
        // Call the method to update Account Description
        Test.startTest();
        UpdateAccountDescription.updateAccountDescription(new List<Contact>{testContact1, testContact2, testContact3, testContact4});
        Test.stopTest();
        
        // Verify the Account Description has been updated
        Account updatedAccount = [SELECT Description FROM Account WHERE Id = :testAccount.Id];
        System.assertEquals('Contact Description 1; Contact Description 2', updatedAccount.Description);
    }
}