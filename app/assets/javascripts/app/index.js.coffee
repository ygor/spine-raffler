#= require json2
#= require jquery
#= require spine
#= require spine/manager
#= require spine/ajax
#= require spine/route

#= require_tree ./lib
#= require_self
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views

class window.App extends Spine.Controller
  @Controller: []
  @Model: []
  
  init: ->
    new App.Controller.Entries(el: @el)
    Spine.Route.setup()    

jQuery -> new App(el: $('#container'))