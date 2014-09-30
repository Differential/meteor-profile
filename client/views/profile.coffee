Template.profile.rendered = ->
  $('#bio').keydown( (event) ->
    if event.keyCode == 13
      $('#bio').blur()
  )

Template.profile.helpers
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

Template._profileField.helpers
  profile: ->
    Meteor.user().profile if Meteor.user()

  isTextField: ->
    @type isnt 'file'

  isCheckbox: ->
    @type is 'checkbox'

  isFileField: ->
    @type is 'file'
