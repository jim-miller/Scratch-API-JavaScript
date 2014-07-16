class @Scratch
  @isLoggedIn = false

  @init: ->
    xhr = new XMLHttpRequest();
    url = "http://pacicific-reaches.herokuapp.com/accounts/profile/";
    params = "merchant=kgtwvge&amount=0.50&description=testing";

    xhr.onreadystatechange = ->
      if this.readyState == this.DONE
        console.log this.responseText
        if this.status == 200 && this.responseText.indexOf("Logged in") > -1
          Scratch.isLoggedIn = true

    xhr.open("GET", url, true)
    xhr.send(params)
