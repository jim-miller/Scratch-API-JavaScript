class @Scratch
  @isLoggedIn = false

  @init: ->
    Scratch.checkLogin()

  @checkLogin: ->
    xhr = new XMLHttpRequest()
    url = "http://pacific-reaches-5138.herokuapp.com/accounts/profile/";

    xhr.onreadystatechange = ->
      if this.readyState == this.DONE
        console.log this.responseText
        if this.status == 200 && this.responseText.indexOf("Logged in as") > -1
          Scratch.isLoggedIn = true

    xhr.open("GET", url, true)
    xhr.send()
