describe 'Scratch', ->

  describe 'Startup', ->
    it 'checks to see if the user is logged in', ->
      spyOn(Scratch, 'isLoggedIn')

      expect(Scratch.isLoggedIn).toHaveBeenCalled

  describe 'User Experience', ->
    it 'creates a payment button'

    describe 'Pressing the payment button', ->
      it 'draws a confirmation dialog'
      it 'darkens the rest of the page'

      describe 'Confirmation dialog', ->
        it 'displays a description of the payment'
        it 'displays the merchant logo'
        it 'shows who is logged into Scratch'
        it 'can be dismissed'

  describe 'Authorizing a Payment', ->

    describe 'Transaction authorization succeeded (200)', ->
      it 'submits the form with the acquired transaction code'

    describe 'One or more parameters are invalid (400)', ->
      it 'displays information from the message body'

    describe 'The user is not currently logged in (401)', ->
      it 'presents a login screen to the user'

    describe 'The user cannot currently pay for the transaction (402)', ->
      it 'notifies the user that adding a payment method might help'

    describe 'Incorrect HTTP method (405)', ->
      it 'presents an error message to the user'
      it 'logs the error'
