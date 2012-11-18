class window.Canvas
    constructor: (@id, @pixelSize=5, @rand=0.8) ->
        @canvas = document.getElementById @id
        @context = @canvas.getContext '2d'

        @width = @canvas.width / @pixelSize
        @height = @canvas.height / @pixelSize

        @map = []

        @context.fillStyle = 'white'
        @context.fillRect 0, 0, @canvas.width, @canvas.height
        
        for i in [0..@width]
            temp = []
            for j in [0..@height]
                if Math.random() >= @rand
                    cell = new Cell()
                    cell.draw @context, i, j, @pixelSize
                else
                    cell = null

                temp.push cell

            @map.push temp

    nextStep: () ->
        # First, we blank the map
        @context.fillStyle = 'white'
        @context.fillRect 0, 0, @canvas.width, @canvas.height

        nextMap = []
        for i in [0..@width]
            temp = []
            for j in [0..@height]
                parents = @lookAround i, j
                neighbours = parents.length
                
                if (neighbours == 2 || neighbours == 3) && @map[i][j]?
                    @map[i][j].draw @context, i, j, @pixelSize
                    
                    temp.push @map[i][j]
                else if neighbours == 3 && not @map[i][j]?
                    cell = new Cell parents
                    cell.draw @context, i, j, @pixelSize

                    temp.push cell
                else
                    temp.push null

            nextMap.push temp

        @map = nextMap.slice 0
        nextMap = null

    lookAround: (x, y) ->
        parents = []
        for i in [-1..1]
            for j in [-1..1]
                if !(i==0 && j==0) && x+i >= 0 && x+i <= @width && y+j >=0 && y+j <= @height
                    if @map[x+i][y+j]?
                        parents.push @map[x+i][y+j]

        return parents
