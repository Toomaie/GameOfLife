// Generated by CoffeeScript 1.3.3
(function() {

  window.Canvas = (function() {

    function Canvas(id) {
      var i, j, temp, val, _i, _j, _ref, _ref1;
      this.id = id;
      this.canvas = document.getElementById(this.id);
      this.context = this.canvas.getContext('2d');
      this.pixelSize = 5;
      this.width = this.canvas.width / this.pixelSize;
      this.height = this.canvas.height / this.pixelSize;
      this.map = [];
      this.nextMap = null;
      for (i = _i = 0, _ref = this.width; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
        temp = [];
        for (j = _j = 0, _ref1 = this.height; 0 <= _ref1 ? _j <= _ref1 : _j >= _ref1; j = 0 <= _ref1 ? ++_j : --_j) {
          val = Math.random() >= 0.89 ? 1 : 0;
          temp.push(val);
        }
        this.map.push(temp);
      }
    }

    Canvas.prototype.drawMap = function() {
      var i, j, _i, _ref, _results;
      this.context.fillStyle = 'white';
      this.context.fillRect(0, 0, this.canvas.width, this.canvas.height);
      this.context.fillStyle = 'black';
      _results = [];
      for (i = _i = 0, _ref = this.width; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
        _results.push((function() {
          var _j, _ref1, _results1;
          _results1 = [];
          for (j = _j = 0, _ref1 = this.height; 0 <= _ref1 ? _j <= _ref1 : _j >= _ref1; j = 0 <= _ref1 ? ++_j : --_j) {
            if (this.map[i][j] === 1) {
              _results1.push(this.context.fillRect(i * this.pixelSize, j * this.pixelSize, this.pixelSize, this.pixelSize));
            } else {
              _results1.push(void 0);
            }
          }
          return _results1;
        }).call(this));
      }
      return _results;
    };

    Canvas.prototype.nextStep = function() {
      var i, j, neighbours, temp, _i, _j, _ref, _ref1;
      this.nextMap = [];
      for (i = _i = 0, _ref = this.width; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
        temp = [];
        for (j = _j = 0, _ref1 = this.height; 0 <= _ref1 ? _j <= _ref1 : _j >= _ref1; j = 0 <= _ref1 ? ++_j : --_j) {
          neighbours = this.lookAround(i, j);
          if (this.map[i][j] === 1) {
            if (neighbours === 2 || neighbours === 3) {
              temp.push(1);
            } else {
              temp.push(0);
            }
          } else {
            if (neighbours === 3) {
              temp.push(1);
            } else {
              temp.push(0);
            }
          }
        }
        this.nextMap.push(temp);
      }
      this.map = this.nextMap.slice(0);
      return this.nextMap = [];
    };

    Canvas.prototype.lookAround = function(x, y) {
      var i, j, val, _i, _j;
      val = 0;
      for (i = _i = -1; _i <= 1; i = ++_i) {
        for (j = _j = -1; _j <= 1; j = ++_j) {
          if (!(i === 0 && j === 0) && x + i >= 0 && x + i < this.width && y + j >= 0 && y + j < this.height && (this.map[x + i][y + j] != null) && this.map[x + i][y + i] === 1) {
            val++;
          }
        }
      }
      return val;
    };

    return Canvas;

  })();

}).call(this);
