// inject bundled Elm app into div#main
var Elm = require('./elm/Main.elm'),
  hook = document.getElementById('main'),
  employeesUrl = hook.dataset.employeesUrl,
  flags = {
    employeesUrl: employeesUrl
  };
Elm.Main.embed(hook, flags);
