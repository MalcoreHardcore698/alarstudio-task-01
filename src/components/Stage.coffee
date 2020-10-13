import { Widget } from './Widget.coffee'
import { Star } from './Star.coffee'
import { Rect } from './Rect.coffee'

export class Stage extends Widget
    constructor: ({ props, layer }) ->
        super()

        @define props, layer
        @listening()
        @render()

        # Listeners
        # @onClick props.onClick, @stage

    @create: (container) ->
        "<canvas id=\"#{container}\" />"

    define: (props, layer) ->
        # Setting default canvas properties
        @$canvas = document.getElementById props.container
        @$canvas.setAttribute 'width', props.width
        @$canvas.setAttribute 'height', props.height

        @stage =
            ctx: @$canvas.getContext '2d'
            layer: layer

    listening: ->
        # Collect all listeners and listening canvas
        # Detect listeners on widgets

    render: ->
        for shape in @stage.layer.childs
            if shape.__type__ is 'Star'
                Star.draw(@stage.ctx, shape)
            else if shape.__type__ is 'Rect'
                Rect.draw(@stage.ctx, shape)