require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

if (document.querySelector("#btn-close")){
  document.querySelector("#btn-close").addEventListener('click', (event) => {
    const errorMessage = document.querySelector('.errors')
    errorMessage.innerHTML = ""
  })
}
if (window.location.href.includes("wrong")){
  document.querySelector("#btn-loggin-home").click()
  const errorMessage = document.querySelector('.errors')
  errorMessage.innerHTML = "Mauvais Email/Mot de passe.\<br>Merci de réessayer.\<br>"
}

