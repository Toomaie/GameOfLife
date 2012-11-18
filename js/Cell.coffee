class window.Cell
    constructor: (parents=null, callback=null) ->
        @color = [0, 0, 0]

        if parents?
            @heuristic "lowest", parents

        else
            for i in [0..2]
                @color[i] = Math.round(Math.random()*250)

        if callback?
            callback()

    draw: (ctx, i, j, s) ->
        ctx.fillStyle = "rgb(#{@color[0]}, #{@color[1]}, #{@color[2]})"
        ctx.fillRect i*s, j*s, s, s

    heuristic: (choice, parents) ->
        switch choice
            # Simply take the color of the first parent
            when "simple" 
                @color = parents[0].color
            
            # Take the average of the colors
            when "average" 
                @color[0] = Math.round((parents[0].color[0] + parents[1].color[0] + parents[2].color[0]) / 3)
                @color[1] = Math.round((parents[0].color[1] + parents[1].color[1] + parents[2].color[1]) / 3)
                @color[2] = Math.round((parents[0].color[2] + parents[1].color[2] + parents[2].color[2]) / 3)
            
            # Take the max of the R, of the G and of the B from parents
            when "rgb" 
                @color[0] = Math.min(parents[0].color[0],parents[1].color[0], parents[2].color[0])
                @color[1] = Math.min(parents[0].color[0],parents[1].color[0], parents[2].color[0])
                @color[2] = Math.min(parents[0].color[0],parents[1].color[0], parents[2].color[0])

            # Take the highest colors from parents (closer to white)
            when "strongest" 
                score = 0
                for parent in parents
                    temp = parent.color[0] + parent.color[1] + parent.color[2]
                    if temp > score
                        @color = parent.color
                        score = temp

            # Take the lowest colors from parents (closer to black)
            when "lowest" 
                score = 1000
                for parent in parents
                    temp = parent.color[0] + parent.color[1] + parent.color[2]
                    if temp < score
                        @color = parent.color
                        score = temp
            else
                @color = parents[0].color


    
