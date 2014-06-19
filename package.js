Package.describe({
  summary: "A package that interacts with Meteor.user().profile at /profile"
});

Package.on_use(function(api) {

  var both = ['client', 'server'];

   api.add_files([
    'client/profile.coffee',
    'client/views/profile.html',
    'client/views/profile.coffee',
    'client/views/profile.less',
    'client/views/userCard.html',
    'client/views/userCard.coffee',
    'client/accounts.coffee'
  ], 'client');

   api.add_files([
    'server/methods.coffee'
  ], 'server');

  api.use([
    'templating',
    'handlebars',
    'less'
  ], 'client');

  api.use([
    'coffeescript',
    'iron-router',
    'simple-form',
    'accounts-base'
  ], both);

  api.add_files([
    'router.coffee'
  ], both);

  api.export('MeteorProfile', ['client', 'server']);
});
