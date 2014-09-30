---
layout: default
username: Differential
repo: meteor-profile
version: 0.0.11
desc: Gives you a basic, out-of-the-box user profile page

---

---

**This package is deprecated.** We will fix bugs, but will neither add new
features nor ensure future Meteor compatibility.  This package is just a thin
wrapper around the
[`simple-form`](https://atmospherejs.com/joshowens/simple-form) package.
Everything that this package is capable of can now be accomplished using
`simple-form` and your own templates, which is probably what you were going to
do anyway.  Thanks for using `profile`.

---

# Meteor Profile

`/profile` interface to Meteor.user().profile.

## Installation

```
meteor add ryw:profile
```

Now head over to `/profile`.

## Field Customization

Example configuration:

{% highlight javascript %}
if (Meteor.isClient) {
  MeteorProfile.config({
    fields: [
      { name: "firstName", required: true },
      { name: "lastName", required: true },
      { name: "organization", required: false },
      { name: "location", required: false },
      { name: "bio", required: false, type: 'text_area' },
      { name: "url", required: false },
      { name: "googlePlusUrl", required: false },
      { name: "twitterHandle", required: false }
    ]
  });
}
{% endhighlight %}

## Showing Profile In Your App

To show a user profile in your app, copy the `userCard` view (renaming
it in the process) and pass a user to it.

{% assign usercard = '{{> userCard}}' %}
You can also just include `{{ usercard }}` directive to show the
template used in the preview within your app.

Make sure to pass user data through `data` in iron-router:

{% highlight javascript %}
Router.map(function() {
  this.route('home', {
    path: '/',
    data: function() {
      return Meteor.user();
    }
  });
});
{% endhighlight %}
