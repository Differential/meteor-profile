Template.userCard.helpers
  name: ->
    if @profile.firstName && @profile.lastName
      "#{@profile.firstName} #{@profile.lastName}"
    else
      ""

  subhead: ->
    if @profile.organization && @profile.location
      [@profile.organization, @profile.location].join(' - ')
    else
      if @profile.organization
        return @profile.organization
      if @profile.location
        return @profile.location

  bio: -> @profile.bio
  url: -> @profile.url
  googlePlusUrl: -> @profile.googlePlusUrl
  twitterHandle: -> @profile.twitterHandle

