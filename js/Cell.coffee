class window.Cell
    constructor: (parents=null, callback=null) ->
        @color = [0, 0, 0]

        if parents?
            @color[0] = Math.round((parents[0].color[0] + parents[1].color[0] + parents[2].color[0]) / 3)
            @color[1] = Math.round((parents[0].color[1] + parents[1].color[1] + parents[2].color[1]) / 3)
            @color[2] = Math.round((parents[0].color[2] + parents[1].color[2] + parents[2].color[2]) / 3)
            # @color = parents[0].color
        else
            for i in [0..2]
                @color[i] = Math.round(Math.random()*250)

        if callback?
            callback()

    draw: (ctx, i, j, s) ->
        ctx.fillStyle = "rgb(#{@color[0]}, #{@color[1]}, #{@color[2]})"
        ctx.fillRect i*s, j*s, s, s




    
