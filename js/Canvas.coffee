class window.Canvas
    constructor: (@id) ->
        @canvas = document.getElementById @id
        @context = @canvas.getContext '2d'

        @pixelSize = 10
        @width = @canvas.width / @pixelSize
        @height = @canvas.height / @pixelSize

        @map = []
        @nextMap = null
        for i in [0..@width]
            temp = []
            for j in [0..@height]
                val = if Math.random() >= 0.79 then 1 else 0
                temp.push val

            @map.push temp

        @drawMap()

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
        # First, we blank the map
        @context.fillStyle = 'white'
        @context.fillRect 0, 0, @canvas.width, @canvas.height

        @context.fillStyle = 'black'

        @nextMap = []
        for i in [0..@width]
            temp = []
            for j in [0..@height]
                neighbours = @lookAround i, j
                
                if neighbours == 2 && @map[i][j] == 1
                    @context.fillRect i*@pixelSize, j*@pixelSize, @pixelSize, @pixelSize
                    temp.push 1
                else if neighbours == 3
                    @context.fillRect i*@pixelSize, j*@pixelSize, @pixelSize, @pixelSize
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
                
                    
                               
                if !(i==0 && j==0) && x+i >= 0 && x+i <= @width && y+j >=0 && y+j <= @height
                    
                    if @map[x+i][y+j] == 1
                        val++

        return val

