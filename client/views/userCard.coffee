Template.userCard.helpers
  name: ->
    if @ and @profile and @profile.firstName and @profile.lastName
      "#{@profile.firstName} #{@profile.lastName}"
    else
      ""

  subhead: ->
    if @ and @profile
      if @profile.organization and @profile.location
        [@profile.organization, @profile.location].join(' - ')
      else
        if @profile.organization
          return @profile.organization
        if @profile.location
          return @profile.location

  bio: -> @profile.bio if @ and @profile
  url: -> @profile.url if @ and @profile
  googlePlusUrl: -> @profile.googlePlusUrl if @ and @profile
  twitterHandle: -> @profile.twitterHandle if @ and @profile
