Router.map ->
  @route 'profile',
    path: '/profile'
    data: ->
      Meteor.user()

  @route 'publicProfile',
    path: '/profile/:user'

    onBeforeAction: ->
      if !MeteorProfile.settings.publicProfile
        Router.go('/')


    action: ->
      @render() if @ready()

    waitOn: -> [
      Meteor.subscribe 'userData', @params.user
    ]

    data: ->
      if Meteor.users.findOne(username: @params.user)
        Meteor.users.findOne(username: @params.user)
      else
        Meteor.users.findOne(@params.user)
