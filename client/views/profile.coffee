Template.profile.rendered = ->
  $('#bio').keydown( (event) ->
    if event.keyCode == 13
      $('#bio').blur()
  )

Template.profile.helpers
  publicUrl: ->
    if Meteor.user() and Meteor.user().username
      "#{AccountsEntry.settings.profileRoute}/#{Meteor.user().username}"
    else
      "#{AccountsEntry.settings.profileRoute}/#{Meteor.userId()}"

  profileFields: ->
    MeteorProfile.settings.fields

  showPreview: ->
    MeteorProfile.settings.showPreview

Template.profile.events
  'submit form': (event) ->
    event.preventDefault()
    data = SimpleForm.processForm(event.target)
    Meteor.users.update Meteor.userId(),
      $set: {profile: data}

  'change .profileField': -> (event)

  # 'click .done': ->
  #   if Meteor.user().profile.firstName
  #     Router.go('/')
  #   else
  #     $('.errors').text('First name is required.')

  # 'change #email': (event) ->
  #   Meteor.call('changeEmail', Meteor.userId(), $(event.target).val())

  # 'change #firstName': (event) ->
  #   Meteor.users.update Meteor.userId(),
  #     $set:
  #       'profile.firstName': $(event.target).val()

  # 'change #lastName': (event) ->
  #   Meteor.users.update Meteor.userId(),
  #     $set:
  #       'profile.lastName': $(event.target).val()

  # 'change #organization': (event) ->
  #   Meteor.users.update Meteor.userId(),
  #     $set:
  #       'profile.organization': $(event.target).val()

  # 'change #location': (event) ->
  #   Meteor.users.update Meteor.userId(),
  #     $set:
  #       'profile.location': $(event.target).val()

  # 'change #bio': (event) ->
  #   Meteor.users.update Meteor.userId(),
  #     $set:
  #       'profile.bio': $(event.target).val()

  # 'change #url': (event) ->
  #   url = $(event.target).val()
  #   if not url.match(/^http/) and not url.match(/^https/) and url isnt ''
  #     url = 'http://' + url
  #   Meteor.users.update Meteor.userId(),
  #     $set:
  #       'profile.url': url

  # 'change #googlePlusUrl': (event) ->
  #   url = $(event.target).val()
  #   if not url.match(/^http/) and not url.match(/^https/) and url isnt ''
  #     url = 'http://' + url
  #   Meteor.users.update Meteor.userId(),
  #     $set:
  #       'profile.googlePlusUrl': url

  # 'change #twitterHandle': (event) ->
  #   Meteor.users.update Meteor.userId(),
  #     $set:
  #       'profile.twitterHandle': $(event.target).val()

Template._profileField.helpers
  profile: ->
    Meteor.user().profile if Meteor.user()

  isTextField: ->
    @type isnt 'file'

  isCheckbox: ->
    @type is 'checkbox'

  isFileField: ->
    @type is 'file'
