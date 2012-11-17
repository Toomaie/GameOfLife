$ ->
    window.Canvas = Canvas
    window.Cell = Cell

    canvas = new Canvas 'c'
    canvas.drawMap()

    main = () ->
        canvas.drawMap()
        canvas.nextStep()

    setInterval main, 300