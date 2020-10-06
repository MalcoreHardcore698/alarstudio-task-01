import { Stage } from './Stage.coffee'
import { Layer } from './Layer.coffee'
import { Star } from './Star.coffee'
import { Rect } from './Rect.coffee'

export class App
    constructor: (model) ->
        @root = document.querySelector '#root'
        @model = model

    init: ->
        @runMain()
        @runPreview()

    runMain: ->
        @render Stage.create @model.main.container
        @main = new Stage
            props: {
                @model.main...
                onClick: (e) =>
                    if e.target.getType() isnt 'Shape'
                        @preview.stage
                            .findOne (node) => node.getType() is 'Shape'
                            .setAttrs fill: @model.rect.fill
                        @preview.stage.batchDraw()
            }

            layer: new Layer
                childs: @model.colors.map (color, index) =>
                    new Star {
                        Star.create( fill: color )...
                        Star.getPositionStar(@model.main, index)...
                        y: (@model.main.height / 2) + Math.sin(index * 1.25) * 150

                        onClick: () =>
                            @preview.stage
                                .findOne (node) => node.getType() is 'Shape'
                                .setAttrs fill: color 
                            @preview.stage.batchDraw()

                        onMouseEnter: (e) =>
                            stage = @main.stage.container()
                            stage.style.cursor = 'pointer'

                        onMouseLeave: (e) =>
                            stage = @main.stage.container()
                            stage.style.cursor = 'default'
                    }

    runPreview: ->
        @render Stage.create @model.preview.container
        @preview = new Stage
            props: @model.preview
            layer: new Layer
                childs: [
                    new Rect { @model.rect..., x: 0, y: 0 }
                ]

    render: (args...) ->
        for child in args
            @root.insertAdjacentHTML 'beforeend', child