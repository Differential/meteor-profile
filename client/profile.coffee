MeteorProfile =
  settings:
    showPreview: true
    fields: [
      {name: "firstName", required: true},
      {name: "lastName", required: true},
      {name: "organization", required: false},
      {name: "location", required: false},
      {name: "bio", required: false, type: 'text_area'},
      {name: "url", required: false},
      {name: "googlePlusUrl", required: false},
      {name: "twitterHandle", required: false}
    ]
  
  config: (options) ->
    @settings = _.extend(@settings, options)
