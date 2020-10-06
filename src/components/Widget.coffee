export class Widget
    onEvent: (event, widget, callback) ->
        if callback
            widget.on event, (evt) => callback evt

    onClick: (callback, widget) ->
        @onEvent 'click', widget, callback

    onMouseEnter: (callback, widget) ->
        @onEvent 'mouseenter', widget, callback

    onMouseLeave: (callback, widget) ->
        @onEvent 'mouseleave', widget, callback