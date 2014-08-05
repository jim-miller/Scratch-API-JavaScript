throw new Error("Scratch requires jQuery to be loaded before any references to the Scratch library") if typeof jQuery is "undefined"

class @Scratch
  server = "http://scratch-stand-in.herokuapp.com"
  server = "http://localhost:9292"
  _isLoggedIn = false

  @init: ->
    instance = new Scratch()

  @checkLogin: ->
    xhr = new XMLHttpRequest();
    url = server + "/accounts/profile/";

    xhr.onreadystatechange = ->
      if this.readyState == this.DONE
        console.log this.responseText
        if this.status == 200 && this.responseText.indexOf("Logged in") > -1
          _isLoggedIn = true
        else
          _isLoggedIn = false

    xhr.open("GET", url, true)
    xhr.send()
    return

  @isLoggedIn: ->
    return _isLoggedIn

  constructor: (args) ->
    console.log('starting up')
    @loadCss()
    @loadFonts()
    @insertPaymentModal()
    @drawPayButtons()
    @createPayLinks()

  loadCss: ->
    cssId = "scratch-button-css"
    unless document.getElementById(cssId)
      head = document.getElementsByTagName("head")[0]
      link = document.createElement("link")
      link.id = cssId
      link.rel = "stylesheet"
      link.type = "text/css"
      link.href = server + "/css/scratch-button.css"
      link.media = "all"
      head.appendChild link

  loadFonts: ->
    cssId = "scratch-fonts-css"
    unless document.getElementById(cssId)
      head = document.getElementsByTagName("head")[0]
      link = document.createElement("link")
      link.id = cssId
      link.rel = "stylesheet"
      link.type = "text/css"
      link.href = "http://fonts.googleapis.com/css?family=Titillium+Web:600"
      link.media = "all"
      head.appendChild link

  insertPaymentModal: ->
    body = document.getElementsByTagName("body")[0]
    modalText = """
      <div aria-hidden="true" aria-labelledby="Confirm Scratch Payment" class="modal fade" id="scratch-payment-modal" role="dialog" tabindex="-1">
        <div class="modal-dialog modal-sm">
          <div class="modal-content">

            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div id="remote-content"></div>
          </div>
        </div>
      </div>
      """
    body.insertAdjacentHTML "afterend", modalText

  drawPayButtons: ->
    # scratchpaybutton classes are actually the script
    # elements, not actual buttons
    buttons = document.getElementsByClassName("scratchpaybutton")
    i = buttons.length - 1

    # Create a button next to each script element
    while i >= 0
      form = buttons[i].parentElement
      amount = parseFloat(form.elements["amount"].value)
      buttons[i].insertAdjacentHTML "afterend", "<div class=\"scratch-button\"><a href=\"#\">$" + amount.toFixed(2) + "</a></div>"

      # Reset the className or we'll get duplicate buttons
      buttons[i].className = ""
      i--

  createPayLinks: ->
    payLinks = document.getElementsByClassName("scratch-button")
    i = payLinks.length - 1

    while i >= 0
      payLinks[i].onclick = _submitPayment
      i--

  _submitPayment = (e) ->
    e.preventDefault()
    form = $(this).parent("form")[0]
    actionUrl = form.action
    formData = $(form).serialize()
    $.post actionUrl, formData, (data) ->
      url = data.confirmation_url
      $("#scratch-payment-modal #remote-content").html "<iframe width=\"100%\" height=\"100%\" frameborder=\"0\" scrolling=\"yes\" allowtransparency=\"true\" src=\"" + url + "\"></iframe>"
      $("#scratch-payment-modal").modal()
      return
    return
