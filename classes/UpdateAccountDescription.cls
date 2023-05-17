public class UpdateAccountDescription {
    public static void updateAccountDescription(List<Contact> contacts) {
        Set<Id> accountIds = new Set<Id>();
        for (Contact c : contacts) {
            accountIds.add(c.AccountId);
        }
        List<Account> accountsToUpdate = [SELECT Id, Description FROM Account WHERE Id IN :accountIds];
        for (Account a : accountsToUpdate) {
            List<String> contactDescriptions = new List<String>();
            for (Contact c : contacts) {
                if (c.AccountId == a.Id && c.Description != null && c.Description != '') {
                    contactDescriptions.add(c.Description);
                }
            }
            if (!contactDescriptions.isEmpty()) {
                String updatedDescription = String.join(contactDescriptions, '; ');
                a.Description = updatedDescription;
            }
        }
        update accountsToUpdate;
    }
}