class App.Controller.Entry extends Spine.Controller
  tag: 'li'
  
  events:
    'click': 'show'
    
  init: ->
    @entry.bind 'update', @render
    @entry.bind 'highlight', @highlight

  show: =>
    @navigate("/entries/#{@entry.id}")
  
  render: (entry) =>
    @entry = entry if entry
    @html @view('entries/entry')(entry: @entry)
    this
    
  highlight: =>
    $('.winner').removeClass('highlight')
    @$('.winner').addClass('highlight')