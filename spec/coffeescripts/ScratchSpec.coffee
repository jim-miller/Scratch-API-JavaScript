describe 'Scratch', ->

  describe 'setMerchantId', ->

    it 'takes a string argument', ->
      result = Scratch.setMerchantId('ABCDEFG12345')
      expect(result).toBe true

  describe 'makePayment', ->
    formValues = null
    mostRecentUrl = null
    mostRecentParams = null

    beforeEach ->
      jasmine.Ajax.install()
      return

    afterEach ->
      jasmine.Ajax.uninstall()

    it 'makes a request authorization using the merchant ID', ->
      # Arrange
      formStub = jasmine.createSpy "formStub"
      callBackStub = jasmine.createSpy "callBack"

      # Act
      Scratch.setMerchantId('ABC')
      Scratch.makePayment formStub, callBackStub

      # Assert
      mostRecentParams = jasmine.Ajax.requests.mostRecent().params
      mostRecentUrl = jasmine.Ajax.requests.mostRecent().url
      expect(mostRecentUrl).toMatch(/authorize/)
      expect(mostRecentParams).toMatch(/merchant_id=ABC/)

    it 'makes requests in cents, not dollars', ->
      # Arrange
      formValues =
        amount: 0.25
      callBackStub = jasmine.createSpy "callBack"

      # Act
      Scratch.setMerchantId('ABC')
      Scratch.makePayment formValues, callBackStub
      mostRecentParams = jasmine.Ajax.requests.mostRecent().params

      # Assert
      expect(mostRecentParams).toMatch(/amount=25/)

    it 'looks for a token upon successful web call', ->
      # Arrange
      formStub = jasmine.createSpy "formStub"
      doneSpy = jasmine.createSpy "success"
      callBack = (args) ->
        if @readyState is @DONE
          doneSpy @responseText.token

      # Act
      Scratch.setMerchantId('ABC')
      Scratch.makePayment formStub, callBack

      # Server sends back a successful call with the token
      jasmine.Ajax.requests.mostRecent().response
        status: 200
        responseText:
          token: "ABCDEFG"

      # Assert
      expect(doneSpy).toHaveBeenCalledWith "ABCDEFG"