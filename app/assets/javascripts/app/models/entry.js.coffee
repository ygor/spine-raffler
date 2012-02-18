class App.Model.Entry extends Spine.Model
  @configure 'Entry', 'name', 'winner'
  @extend Spine.Model.Ajax
  @url: '/api/entries'

  validate: ->
    "Name is required" unless @name
  
  win: ->
    @save(winner: true)
    @trigger('highlight')
    
  @drawWinner: ->
    winner = $.shuffle(@all())[0]
    winner.win() if winner