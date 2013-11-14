Router.map ->
  @route 'profile',
    path: '/profile'
    data: ->
      Meteor.user()
