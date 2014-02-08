---
layout: default
username: BeDifferential
repo: meteor-profile
version: 0.0.7
desc: Gives you a basic, out-of-the-box user profile page 

---
# Meteor Profile

`/profile` interface to Meteor.user().profile.

## Field customization

All fields are hardcoded - and that's lame. Need to drive the form based
on a configuration, see [this issue](https://github.com/BeDifferential/meteor-profile/issues/3).

In the short term, I'd say if you need custom fields, just copy files
from this package into your app directly.

## Showing profile in your app

To show a user profile in your app, copy the `userCard` view (renaming
it in the process) and pass a user to it.

{% assign usercard = '{{> userCard}}' %}
You can also just include `{{ usercard }}` directive to show the
template used in the preview within your app.

Make sure to pass user data through `data` in the router:

```
Router.map ->
  @route 'home',
    path: '/',
    template: 'home'
    data: ->
      Meteor.user()
```
