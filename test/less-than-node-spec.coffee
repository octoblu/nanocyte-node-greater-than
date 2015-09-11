LessThanNode = require '../src/less-than-node'
describe 'LessThanNode', ->
  beforeEach ->
    @sut = new LessThanNode

  it 'should exist', ->
    expect(@sut).to.exist

  it 'should have an onMessage function', ->
    expect(@sut.onMessage).to.exist

  describe '->onMessage', ->
    describe 'when called with left less than right', ->
      beforeEach ->
        @config =
          left: 1
          right: 5
        @message = 'sup brah'

        @callback = sinon.spy()
        @sut = new LessThanNode @config
        @sut.onMessage @message, @callback

      it 'should call the callback with the message', ->
        expect(@callback).to.have.been.calledWith null, @message

    describe 'when called with left not less than right', ->
      beforeEach ->
        @config =
          left: 10
          right: 6
        @message = 'dude bro'

        @callback = sinon.spy()
        @sut = new LessThanNode @config
        @sut.onMessage @message, @callback

      it 'should call the callback with null', ->
        expect(@callback).to.have.been.calledWith null
        expect(@callback).to.not.have.been.calledWith @message
