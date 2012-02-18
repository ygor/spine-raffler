class App.Controller.Entries extends Spine.Controller
  events:
    'submit #new_entry': 'create'
    'click #draw': -> App.Model.Entry.drawWinner()

  init: ->
    @routes
      '/': @index
      '/entries/:id': @show
    
    App.Model.Entry.bind "refresh", @render
    App.Model.Entry.bind "create", @appendEntry
    App.Model.Entry.refresh(@el.data('entries'))

  index: ->
      
  show: (params) =>
    alert "Entry: #{params['id']}"

  create: (event) ->
    event.preventDefault()
    entry = new App.Model.Entry(name: $('#new_entry_name').val())
    if entry.save() then $('#new_entry')[0].reset() else alert(entry.validate()) 

  render: =>
    @html @view('entries/index')()
    App.Model.Entry.each @appendEntry
    this

  appendEntry: (entry) =>
    view = new App.Controller.Entry(entry: entry)
    @$('#entries').append view.render().el