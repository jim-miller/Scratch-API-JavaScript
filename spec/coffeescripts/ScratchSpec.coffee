describe 'Scratch', ->

  beforeEach ->
    jasmine.Ajax.install()

  afterEach ->
    jasmine.Ajax.uninstall()

  describe 'Startup', ->
    it 'makes a call back to the Scratch server looking for login', ->
      Scratch.init()
      mostRecentRequest = jasmine.Ajax.requests.mostRecent()

      expect(mostRecentRequest).not.toBeUndefined
      expect(mostRecentRequest.method).toEqual("GET")

  describe '#isLoggedIn', ->
    it 'returns false when login text is NOT found', ->
      Scratch.init()

      jasmine.Ajax.requests.mostRecent().response
        status: 200
        contentType: "text/html"
        responseText: "Missing login text"

      expect(Scratch.isLoggedIn).toBe(false)

    it 'returns true when login text IS found"', ->
      Scratch.init()

      jasmine.Ajax.requests.mostRecent().response
        status: 200
        contentType: "text/html"
        responseText: "Logged in as"

      expect(Scratch.isLoggedIn).toBe true
      console.log Scratch.isLoggedIn

  describe 'User Experience', ->
    it 'creates a payment button'

    describe 'Pressing the payment button', ->
      describe 'when logged in', ->
        it 'darkens the rest of the page'
        it 'submits product details to the merchant server'

        describe 'successful transaction creation', ->
          it 'receives a Scratch payment URL to redirect to'

        describe 'error received', ->
          it 'displays the error to the user'

        describe 'timeout', ->
          it 'informs the user of the timeout'

      describe 'when not logged in', ->
        it 'opens a new window with the Scratch login'

  describe 'Completing a Payment', ->
    it 'receives a message from the iframe'
