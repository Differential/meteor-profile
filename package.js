Package.describe({
  summary: "A package that interacts with Meteor.user().profile at /profile"
});

Package.on_use(function(api) {

  var both = ['client', 'server'];

  /**
   * Files for client
   */

   api.add_files([
    'client/views/profile.html',
    'client/views/profile.coffee',
    'client/views/profile.less',
    'client/views/userCard.html',
    'client/views/userCard.coffee'
  ], 'client');

  /**
   * Packages for client
   */

  api.use([
    'templating',
    'handlebars',
    'less'
  ], 'client');

  /**
   * Packages for server and client
   */

  api.use([
    'coffeescript',
    'iron-router',
    'accounts-base'
  ], both);

  /**
   * Files for server and client
   */

  api.add_files([
    'router.coffee'
  ], both);

});
