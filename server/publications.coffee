Meteor.publish 'userData', (username) ->
  Meteor.users.find username: username
