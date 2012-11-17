class window.Canvas
    constructor: (@id) ->
        @canvas = document.getElementById @id
        @context = @canvas.getContext '2d'

        @pixelSize = 5
        @width = @canvas.width / @pixelSize
        @height = @canvas.height / @pixelSize

        @map = []
        @nextMap = null
        for i in [0..@width]
            temp = []
            for j in [0..@height]
                val = if Math.random() >= 0.89 then 1 else 0
                temp.push val

            @map.push temp

    drawMap: () ->
        # First, we blank the map
        @context.fillStyle = 'white'
        @context.fillRect 0, 0, @canvas.width, @canvas.height

        @context.fillStyle = 'black'

        for i in [0..@width]
            for j in [0..@height]
                if @map[i][j] == 1
                    @context.fillRect i*@pixelSize, j*@pixelSize, @pixelSize, @pixelSize

    nextStep: () ->
        @nextMap = []
        for i in [0..@width]
            temp = []
            for j in [0..@height]
                neighbours = @lookAround i, j
                if @map[i][j] == 1
                    if neighbours == 2 || neighbours == 3
                        temp.push 1
                    else
                        temp.push 0
                else
                    if neighbours == 3
                        temp.push 1
                    else
                        temp.push 0

            @nextMap.push temp

        @map = @nextMap.slice 0
        @nextMap = []

    lookAround: (x, y) ->
        val = 0
        for i in [-1..1]
            for j in [-1..1]
                if !(i==0 && j==0) && x+i >= 0 && x+i < @width && y+j >=0 && y+j <@height && @map[x+i][y+j]? && @map[x+i][y+i] == 1
                    val++

        return val







