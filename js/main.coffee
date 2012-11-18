$ ->
    window.Canvas = Canvas
    window.Cell = Cell

    c = document.getElementById('c')
    c.width = document.width
    c.height = document.height

    canvas = new Canvas 'c'

    main = () ->
        canvas.nextStep()

    setInterval main, 100

    canvasOnClick = (e) ->
        pos = getCursorPosition e
        cell = new Cell()

        pos.x = Math.floor(pos.x/canvas.pixelSize)
        pos.y = Math.floor(pos.y/canvas.pixelSize)

        canvas.map[pos.x][pos.y] = cell
        cell.draw canvas.context, pos.x, pos.y, canvas.pixelSize, canvas.pixelSize

    getCursorPosition = (e) ->
        if e.pageX || e.pageY
            x = e.pageX
            y = e.pageY
        else
            x = e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft
            y = e.clientY + document.body.scrollTop + document.documentElement.scrollTop

        return {x: x, y: y}

    c.addEventListener "click", canvasOnClick
