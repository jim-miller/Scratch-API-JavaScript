window.Scratch = class Scratch

Scratch.setMerchantId = (id) ->
  @merchantId = id
  true

Scratch.makePayment = (inVals, callBack) ->
  xhr = new XMLHttpRequest()
  success = false

  xhr.onreadystatechange = callBack

  params = "merchant_id=" + @merchantId + "&amount="+parseInt(inVals.amount * 100)
  xhr.open "GET", "https://api.paywithscratch.com/v1/authorize/"
  xhr.send(params)
