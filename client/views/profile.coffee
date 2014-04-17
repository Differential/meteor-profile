Template.profile.rendered = ->
  $('#bio').keydown( (event) ->
    if event.keyCode == 13
      $('#bio').blur()
  )

Template.profile.helpers
  email:         -> Meteor.user().emails[0].address if Meteor.user() and Meteor.user().emails?
  firstName:     -> Meteor.user().profile.firstName if Meteor.user()
  lastName:      -> Meteor.user().profile.lastName if Meteor.user()
  organization:  -> Meteor.user().profile.organization if Meteor.user()
  location:      -> Meteor.user().profile.location if Meteor.user()
  bio:           -> Meteor.user().profile.bio if Meteor.user()
  url:           -> Meteor.user().profile.url if Meteor.user()
  googlePlusUrl: -> Meteor.user().profile.googlePlusUrl if Meteor.user()
  twitterHandle: -> Meteor.user().profile.twitterHandle if Meteor.user()

Template.profile.events
  'click .done': ->
    if Meteor.user().profile.firstName
      Router.go('/')
    else
      $('.errors').text('First name is required.')

  'change #email': (event) ->
    Meteor.call('changeEmail', Meteor.userId(), $(event.target).val())

  'change #firstName': (event) ->
    Meteor.users.update Meteor.userId(),
      $set:
        'profile.firstName': $(event.target).val()

  'change #lastName': (event) ->
    Meteor.users.update Meteor.userId(),
      $set:
        'profile.lastName': $(event.target).val()

  'change #organization': (event) ->
    Meteor.users.update Meteor.userId(),
      $set:
        'profile.organization': $(event.target).val()

  'change #location': (event) ->
    Meteor.users.update Meteor.userId(),
      $set:
        'profile.location': $(event.target).val()

  'change #bio': (event) ->
    Meteor.users.update Meteor.userId(),
      $set:
        'profile.bio': $(event.target).val()

  'change #url': (event) ->
    url = $(event.target).val()
    if not url.match(/^http/) and not url.match(/^https/) and url isnt ''
      url = 'http://' + url
    Meteor.users.update Meteor.userId(),
      $set:
        'profile.url': url

  'change #googlePlusUrl': (event) ->
    url = $(event.target).val()
    if not url.match(/^http/) and not url.match(/^https/) and url isnt ''
      url = 'http://' + url
    Meteor.users.update Meteor.userId(),
      $set:
        'profile.googlePlusUrl': url

  'change #twitterHandle': (event) ->
    Meteor.users.update Meteor.userId(),
      $set:
        'profile.twitterHandle': $(event.target).val()
