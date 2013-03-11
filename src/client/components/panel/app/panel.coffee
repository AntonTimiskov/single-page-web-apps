require('lib/setup')

Spine = require('spine')

class Panel extends Spine.Controller

    events:
        'click .q-refresh a': 'refresh'

    constructor: ->
        super
        @children = []
        @render()

    render: ->
        @html require('views/panel-layout')({
            title: @title,
            count: @count
        })

    updateCount: (n)->
        @count = n
        $('.q-header .q-position .number').text(@count)

    refresh: ->
        for child in @children
            child.trigger 'refresh', @updateCount

    add: (child)->
        @children.push child
        
    body: -> $('.q-body')

module.exports = Panel
    
