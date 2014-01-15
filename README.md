# Meteor Profile

`/profile` interface to Meteor.user().profile




## Adding profile information on other pages

Add this to the page:
```
{{#if currenUser}}
{{> userCard}}
{{/if}}
```

And make sure to pass user data through `data` in the router:
```
Router.map ->
  @route 'home',
    path: '/',
    template: 'home'
    data: ->
      Meteor.user()
```
