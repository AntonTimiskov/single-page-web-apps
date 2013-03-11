require('lib/setup')

Spine = require('spine')
Tools = require('tools')

class Graph extends Spine.Controller
    constructor: ->
        super
        @items = []
        @bind_events()
        @update()

    bind_events: ->
        @Model.bind 'refresh', (i)=> @data_refresh(i)
        @bind 'refresh', @update
            
    data_refresh: (@items)-> 
        @render(@items)
        if @items.length > 0 and @callback?
            @callback(Tools.total(@items))

    update: (@callback)->
        @Model.fetch()

    render: (@items)->
        content = require('views/layout')({
                items: @items,
                total: Tools.total,
                percent: Tools.percent
        })

        @html content

module.exports = Graph
    
