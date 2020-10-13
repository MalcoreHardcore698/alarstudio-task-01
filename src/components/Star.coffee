import { Widget } from './Widget.coffee'

export class Star extends Widget
    constructor: (args) ->
        super()

        for [key, value] in Object.entries args
            @[key] = value

        @__type__ = 'Star'

        # Listeners
        #@onClick args.onClick, @shape
        #@onMouseEnter args.onMouseEnter, @shape
        #@onMouseLeave args.onMouseLeave, @shape

    @create: (args) ->
        return {
            x: 50
            y: 50
            innerRadius: 40
            outerRadius: 70
            numPoints: 5
            args...
        }

    @draw: (ctx, shape) ->
        [x, y] = [shape.x, shape.y]

        innerRadius = shape.innerRadius
        outerRadius = shape.outerRadius

        root = Math.PI / 2 * 3
        step = Math.PI / shape.numPoints

        ctx.beginPath()
        ctx.moveTo(shape.x, shape.y - outerRadius)
        for i in [0..shape.numPoints]
            x = shape.x + Math.cos(root) * outerRadius;
            y = shape.y + Math.sin(root) * outerRadius;
            ctx.lineTo(x, y)
            root += step

            x = shape.x + Math.cos(root) * innerRadius;
            y = shape.y + Math.sin(root) * innerRadius;
            ctx.lineTo(x, y)
            root += step

        ctx.lineTo(shape.x, shape.y - outerRadius)
        ctx.closePath()

        ctx.fillStyle = shape.fill
        ctx.fill()

    @getPositionStar: (stage, index) ->
        radius = 150
        angle = index * 1.25

        x: (stage.width / 2) + Math.cos(angle) * radius
        y: (stage.height / 2) + Math.sin(angle) * radius