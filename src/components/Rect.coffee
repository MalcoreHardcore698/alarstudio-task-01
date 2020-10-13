import { Widget } from './Widget.coffee'

export class Rect extends Widget
    constructor: (args) ->
        super()
        
        for [key, value] in Object.entries args
            @[key] = value

        @__type__ = 'Rect'
    
    @draw: (ctx, shape) ->
        ctx.fillRect(
            shape.x
            shape.y
            shape.width
            shape.height
        )

        ctx.fillStyle = shape.fill
        ctx.fill()