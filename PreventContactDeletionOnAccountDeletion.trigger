trigger PreventContactDeletionOnAccountDeletion on Account (before delete) {
    CopadoTest.preventContactDeletionOnAccountDeletion(Trigger.old);
}