require = window.require

describe 'Graph UI', ->
    it 'should show application', ->
        specs('mock')()
        App = require("graph")
        Model = require("model/job")

        new App({el: $("#main"), Model: Model })
        waitsFor( (-> $('.q-graph').is(':visible')), 500, 'graph should renders')

    it 'percentage', ->
        expect( $('.q-legend .q-item-0 .q-legend-value').text() ).toEqual('10 (10%)')
        expect( $('.q-legend .q-item-1 .q-legend-value').text() ).toEqual('30 (30%)')
        expect( $('.q-legend .q-item-2 .q-legend-value').text() ).toEqual('40 (40%)')
        expect( $('.q-legend .q-item-3 .q-legend-value').text() ).toEqual('20 (20%)')
