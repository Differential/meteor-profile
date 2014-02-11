Meteor.startup ->
  if AccountsEntry
    AccountsEntry.config
      profileRoute: "/profile"
