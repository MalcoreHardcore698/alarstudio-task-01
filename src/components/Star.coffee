import { Widget } from './Widget.coffee'

export class Star extends Widget
    constructor: (args) ->
        super()

        @shape = new Konva.Star args

        # Listeners
        @onClick args.onClick, @shape
        @onMouseEnter args.onMouseEnter, @shape
        @onMouseLeave args.onMouseLeave, @shape

    @create: (args) ->
        return {
            x: 50
            y: 50
            innerRadius: 40
            outerRadius: 70
            numPoints: 5
            args...
        }

    @getPositionStar: (stage, index) ->
        radius = 150
        angle = index * 1.25

        x: (stage.width / 2) + Math.cos(angle) * radius
        y: (stage.height / 2) + Math.sin(angle) * radius