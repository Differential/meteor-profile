Template.userCard.helpers
  name: ->
    "#{@profile.firstName} #{@profile.lastName}"

  subhead: ->
    if @profile.organization && @profile.location
      [@profile.organization, @profile.location].join(' - ')
    else
      if @profile.organization
        return @profile.organization
      if @profile.location
        return @profile.location

  bio: ->
    @profile.bio

  url: ->
    @profile.url
