$ ->
    window.Canvas = Canvas
    window.Cell = Cell

    canvas = new Canvas 'c'

    main = () ->
        canvas.nextStep()

    setInterval main, 100
    # setTimeout main, 5000