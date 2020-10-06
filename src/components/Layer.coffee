export class Layer
    constructor: ({ props, childs }) ->
        layer = new Konva.Layer props

        childs.forEach (child) => layer.add child.shape
        
        return layer: layer, childs: childs