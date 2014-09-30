Package.describe({
  summary: "A package that interacts with Meteor.user().profile at /profile",
  version: '0.0.11',
  name: "ryw:profile",
  git: 'https://github.com/Differential/meteor-profile'
});

Package.onUse(function(api) {
  api.versionsFrom("METEOR@0.9.0");

  var both = ['client', 'server'];

  api.addFiles([
    'client/profile.coffee',
    'client/views/profile.html',
    'client/views/profile.coffee',
    'client/views/profile.less',
    'client/views/userCard.html',
    'client/views/userCard.coffee',
    'client/accounts.coffee'
  ], 'client');

  api.addFiles([
    'server/methods.coffee'
  ], 'server');

  api.use([
    'templating',
    'handlebars',
    'less'
  ], 'client');

  api.use([
    'coffeescript',
    'iron:router@0.9.1',
    'joshowens:simple-form@0.1.8',
    'accounts-base'
  ], both);

  api.addFiles([
    'router.coffee'
  ], both);

  api.export('MeteorProfile', ['client', 'server']);
});
