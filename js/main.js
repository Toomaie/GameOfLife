// Generated by CoffeeScript 1.3.3
(function() {

  $(function() {
    var c, canvas, main;
    window.Canvas = Canvas;
    window.Cell = Cell;
    c = document.getElementById('c');
    c.width = document.width;
    c.height = document.height;
    canvas = new Canvas('c');
    main = function() {
      return canvas.nextStep();
    };
    return setInterval(main, 100);
  });

}).call(this);
