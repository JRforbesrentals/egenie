'use strict';

/**
 * @ngdoc overview
 * @name egenieApp
 * @description
 * # egenieApp
 *
 * Main module of the application.
 */
angular
  .module('egenieApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch'
  ])
  .config(function ($routeProvider) {
    $routeProvider
      .otherwise({
        redirectTo: '/'
      });
  });
