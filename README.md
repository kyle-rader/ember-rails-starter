# Ember-Rails-Starter

This project is a template for building a Rails API backend, that also serves an `index.html` that loads a sing-page Ember JS application.

Locally, this can developed using Docker and Docker-Compose. The `client/` folder holds the Ember app while the root dir looks like a regular Rails 6 application.

The `package.json` for the Ember app has a `heroku-postbuild` step which builds the JS and CSS assets, and copies them into `/public/`.

This is deployable to Heroku using 2 buildpacks.
1. [A fork of the Official NodeJS buildpack](https://github.com/kyle-rader/heroku-buildpack-nodejs) that I made with the very small change of setting the `BUILD_DIR` to `BUILD_DIR/client` so that it operates on the Ember app.
2. The official Ruby buildpack.

On deploy (setup with heroku's Github integration) the NodeJS buildpack builds the ember app, copies the `dist/` and `index.html` into the root `public/` dir. Then the Ruby buildpack prepares the Rails app for production and produces the final Heroku slug for deployment. Right now this Slug is about `87MB` and the total size of assets download on first pageload (which is currently the whole app) is `973KB`. That's pretty slick for an EmberJS SPA. We're using Tailwind CSS for styles.

Coming Soon: A more detailed walkthrough of this setup which I plan to use for building an interactive/real-time mini-games application to play games with my friends and family in these remote COVID times.

If you're reading this and have a burning desire to know those details now, feel free to open an issue :).