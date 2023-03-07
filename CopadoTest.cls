public class CopadoTest {
    public static void preventContactDeletionOnAccountDeletion(List<Account> accounts) {
        Set<Id> accountIds = new Set<Id>();
        for (Account a : accounts) {
            accountIds.add(a.Id);
        }
        
        List<Contact> relatedContacts = [SELECT Id, AccountId FROM Contact WHERE AccountId IN :accountIds];
        
        for (Contact c : relatedContacts) {
            if (accountIds.contains(c.AccountId)) {
                c.addError('Cannot delete Contact when their related Account is being deleted.');
            }
        }
    }
}