$ ->
    window.Canvas = Canvas
    window.Cell = Cell

    # Just to make it fullscreen
    c = document.getElementById('c')
    c.width = document.width
    c.height = document.height

    canvas = new Canvas 'c'

    main = () ->
        canvas.nextStep()

    setInterval main, 100
