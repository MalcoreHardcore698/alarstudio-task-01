import { Widget } from './Widget.coffee'

export class Stage extends Widget
    constructor: ({ props, layer }) ->
        super()

        @stage = new Konva.Stage props

        # Listeners
        @onClick props.onClick, @stage

        @stage.add layer.layer

    @create: (container) ->
        "<div id=\"#{container}\" class=\"canvas\"></div>"