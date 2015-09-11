GreaterThanNode = require '../src/greater-than-node'
describe 'GreaterThanNode', ->
  beforeEach ->
    @sut = new GreaterThanNode

  it 'should exist', ->
    expect(@sut).to.exist

  it 'should have an onMessage function', ->
    expect(@sut.onMessage).to.exist

  describe '->onMessage', ->
    describe 'when called with left greater than right', ->
      beforeEach ->
        @config =
          left: 10
          right: 5
        @message = 'sup brah'

        @callback = sinon.spy()
        @sut = new GreaterThanNode @config
        @sut.onMessage @message, @callback

      it 'should call the callback with the message', ->
        expect(@callback).to.have.been.calledWith null, @message

    describe 'when called with left not greater than right', ->
      beforeEach ->
        @config =
          left: 10
          right: 6
        @message = 'dude bro'

        @callback = sinon.spy()
        @sut = new GreaterThanNode @config
        @sut.onMessage @message, @callback

      it 'should call the callback with null', ->
        expect(@callback).to.have.been.calledWith null
        expect(@callback).to.not.have.been.calledWith @message
