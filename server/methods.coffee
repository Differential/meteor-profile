Meteor.startup ->
  Meteor.methods

    changeEmail: (userId, email) ->
      Meteor.users.update userId,
        $set:
          'emails': [address: email]
