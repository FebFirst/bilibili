/**
 * Binary Search Stubs for JS Arrays
 * @license MIT
 * @author Jim Chen
 */
var BinArray = (function(){
	var BinArray = {};
	BinArray.bsearch = function(arr, what, how){
		if(arr.length === 0) {
			return 0;
		}
		if(how(what,arr[0]) < 0) {
			return 0;
		}
		if(how(what,arr[arr.length - 1]) >=0) {
			return arr.length;
		}
		var low =0;
		var i = 0;
		var count = 0;
		var high = arr.length - 1;
		while(low<=high){
			i = Math.floor((high + low + 1)/2);
			count++;
			if(how(what,arr[i-1])>=0 && how(what,arr[i])<0){
				return i;
			}
			if(how(what,arr[i-1])<0){
				high = i-1;
			}else if(how(what,arr[i])>=0){
				low = i;
			}else {
				console.error('Program Error');
			}
			if(count > 1500) { console.error('Too many run cycles.'); }
		}
		return -1; // Never actually run
	};
	BinArray.binsert = function(arr, what, how){
		var index = BinArray.bsearch(arr,what,how);
		arr.splice(index,0,what);
		return index;
	};
	return BinArray;
})();

var __extends = this.__extends || function (d, b) {
		for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
		function __() { this.constructor = d; }
		__.prototype = b.prototype;
		d.prototype = new __();
	};

/**
 * 针对所有弹幕。
 */
var CommentSpaceAllocator = (function () {
	/**
	 * 给弹幕分配屏幕空间。width和height表示宽度和高度，avoid为1表示为了不重叠应调整的距离，_pools表示整个弹幕池（二维数组）
	 * */
	function CommentSpaceAllocator(width, height) {
		if (typeof width === "undefined") { width = 0; }
		if (typeof height === "undefined") { height = 0; }
		this._pools = [
			[]
		];
		this.avoid = 1;
		this._width = width;
		this._height = height;
	}

	/**
	 * 检测弹幕是否会（横向）冲突。existing表示已存在的弹幕，check表示待检测（未加入）的弹幕
	 */
	CommentSpaceAllocator.prototype.willCollide = function (existing, check) {
		return existing.stime + existing.ttl >= check.stime + check.ttl / 2;
	};

	/**
	 * 检查路径是否合法。y表示待加入弹幕（即第二个参数comment）的纵坐标，comment表示弹幕，pool表示传入的弹幕池（一维数组）
	 */
	CommentSpaceAllocator.prototype.pathCheck = function (y, comment, pool) {
		var bottom = y + comment.height;
		var right = comment.right;
		for (var i = 0; i < pool.length; i++) {
			if (pool[i].y > bottom || pool[i].bottom < y) {
				continue;
			} else if (pool[i].right < comment.x || pool[i].x > right) {
				if (this.willCollide(pool[i], comment)) {
					return false;
				} else {
					continue;
				}
			} else {
				return false;
			}
		}
		return true;
	};

	/**
	 * 为弹幕初始化。comment为待添加的弹幕，cindex为comment的一维弹幕池偏移量
	 * 如果一维弹幕池为空或者有不冲突的位置则加入这个弹幕池否则递归寻找下一个
	 */
	CommentSpaceAllocator.prototype.assign = function (comment, cindex) {
		while (this._pools.length <= cindex) {
			this._pools.push([]);
		}
		var pool = this._pools[cindex];
		if (pool.length === 0) {
			comment.cindex = cindex;
			return 0;
		} else if (this.pathCheck(0, comment, pool)) {
			comment.cindex = cindex;
			return 0;
		}
		var y = 0;
		for (var k = 0; k < pool.length; k++) {
			y = pool[k].bottom + this.avoid;
			if (y + comment.height > this._height) {
				break;
			}
			if (this.pathCheck(y, comment, pool)) {
				comment.cindex = cindex;
				return y;
			}
		}

		return this.assign(comment, cindex + 1);
	};

	/**
	 * 向二维弹幕池中添加弹幕。如果comment的高度大于已分配空间的高度则undefined，否则遍历一维弹幕池插入弹幕
	 */
	CommentSpaceAllocator.prototype.add = function (comment) {
		if (comment.height > this._height) {
			comment.cindex = -2;
			comment.y = 0;
		} else {
			comment.y = this.assign(comment, 0);
			BinArray.binsert(this._pools[comment.cindex], comment, function (a, b) {
				if (a.bottom < b.bottom) {
					return -1;
				} else if (a.bottom > b.bottom) {
					return 1;
				} else {
					return 0;
				}
			});
		}
	};

	/**
	 * 删除弹幕。从index开始删除一个
	 */
	CommentSpaceAllocator.prototype.remove = function (comment) {
		if (comment.cindex < 0) {
			return;
		}
		if (comment.cindex >= this._pools.length) {
			throw new Error("cindex out of bounds");
		}
		var index = this._pools[comment.cindex].indexOf(comment);
		if (index < 0)
			return;
		this._pools[comment.cindex].splice(index, 1);
	};

	/**
	 * 设定屏幕空间的边界。
	 */
	CommentSpaceAllocator.prototype.setBounds = function (width, height) {
		this._width = width;
		this._height = height;
	};
	return CommentSpaceAllocator;
})();

/**
 * 针对固定弹幕。
 */
var AnchorCommentSpaceAllocator = (function (_super) {
	__extends(AnchorCommentSpaceAllocator, _super);
	function AnchorCommentSpaceAllocator() {
		_super.apply(this, arguments);
	}
	/**
	 * 在中间位置添加弹幕。
	 */
	AnchorCommentSpaceAllocator.prototype.add = function (comment) {
		_super.prototype.add.call(this, comment);
		comment.x = (this._width - comment.width) / 2;
	};

	/**
	 * 因为位置固定（顶端或底端）所以必然会冲突。
	 */
	AnchorCommentSpaceAllocator.prototype.willCollide = function (a, b) {
		return true;
	};

	/**
	 * 检查路径冲突。
	 */
	AnchorCommentSpaceAllocator.prototype.pathCheck = function (y, comment, pool) {
		var bottom = y + comment.height;
		for (var i = 0; i < pool.length; i++) {
			if (pool[i].y > bottom || pool[i].bottom < y) {
				continue;
			} else {
				return false;
			}
		}
		return true;
	};
	return AnchorCommentSpaceAllocator;
})(CommentSpaceAllocator);

var __extends = this.__extends || function (d, b) {
		for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
		function __() { this.constructor = d; }
		__.prototype = b.prototype;
		d.prototype = new __();
	};

/**
 * 对于核心弹幕的定义。
 */
var CoreComment = (function () {
	/**
	 * 核心弹幕绑定comment_manager并初始化
	 */
	function CoreComment(parent, init) {
		if (typeof init === "undefined") { init = {}; }
		this.mode = 1;
		this.stime = 0;
		this.text = "";
		this.ttl = 4000;	//存活时间（ms）
		this.dur = 4000;	//持续时间（ms）
		this.cindex = -1;
		this.motion = [];
		this.movable = true;
		this._alphaMotion = null;
		this.absolute = true;
		this.align = 0;
		this._alpha = 1;
		this._size = 25;
		this._color = 0xffffff;
		this._border = false;
		this._shadow = true;
		this._font = "";
		if (!parent) {
			throw new Error("Comment not bound to comment manager.");
		} else {
			this.parent = parent;
		}
		if (init.hasOwnProperty("stime")) {
			this.stime = init["stime"];
		}
		if (init.hasOwnProperty("mode")) {
			this.mode = init["mode"];
		} else {
			this.mode = 1;
		}
		if (init.hasOwnProperty("dur")) {
			this.dur = init["dur"];
			this.ttl = this.dur;
		}
		this.dur *= this.parent.options.global.scale;
		this.ttl *= this.parent.options.global.scale;
		if (init.hasOwnProperty("text")) {
			this.text = init["text"];
		}
		if (init.hasOwnProperty("motion")) {
			this._motionStart = [];
			this._motionEnd = [];
			this.motion = init["motion"];
			var head = 0;
			for (var i = 0; i < init["motion"].length; i++) {
				this._motionStart.push(head);
				var maxDur = 0;
				for (var k in init["motion"][i]) {
					var m = init["motion"][i][k];
					maxDur = Math.max(m.dur, maxDur);
					if (m.easing === null || m.easing === undefined) {
						init["motion"][i][k]["easing"] = CoreComment.LINEAR;
					}
				}
				head += maxDur;
				this._motionEnd.push(head);
			}
			this._curMotion = 0;
		}
		if (init.hasOwnProperty("color")) {
			this._color = init["color"];
		}
		if (init.hasOwnProperty("size")) {
			this._size = init["size"];
		}
		if (init.hasOwnProperty("border")) {
			this._border = init["border"];
		}
		if (init.hasOwnProperty("opacity")) {
			this._alpha = init["opacity"];
		}
		if (init.hasOwnProperty("alpha")) {
			this._alphaMotion = init["alpha"];
		}
		if (init.hasOwnProperty("font")) {
			this._font = init["font"];
		}
		if (init.hasOwnProperty("x")) {
			this._x = init["x"];
		}
		if (init.hasOwnProperty("y")) {
			this._y = init["y"];
		}
		if (init.hasOwnProperty("shadow")) {
			this._shadow = init["shadow"];
		}
		if (init.hasOwnProperty("position")) {
			if (init["position"] === "relative") {
				this.absolute = false;
				if (this.mode < 7) {
					console.warn("Using relative position for CSA comment.");
				}
			}
		}
	}
	/**
	 * 初始化弹幕。能复用则复用。
	 */
	CoreComment.prototype.init = function (recycle) {
		if (typeof recycle === "undefined") { recycle = null; }
		if (recycle !== null) {
			this.dom = recycle.dom;
		} else {
			this.dom = document.createElement("div");
		}
		this.dom.className = this.parent.options.global.className;
		this.dom.appendChild(document.createTextNode(this.text));	//text就是弹幕内容
		this.dom.textContent = this.text;
		this.dom.innerText = this.text;
		this.size = this._size;
		if (this._color !== 0xffffff) {
			this.color = this._color;
		}
		this.shadow = this._shadow;
		if (this._border) {
			this.border = this._border;
		}
		if (this._font !== "") {
			this.font = this._font;
		}
		if (this._x !== undefined) {
			this.x = this._x;
		}
		if (this._y !== undefined) {
			this.y = this._y;
		}
		if (this._alpha !== 1 || this.parent.options.global.opacity < 1) {
			this.alpha = this._alpha;
		}
		if (this.motion.length > 0) {
			this.animate();
		}
	};

	/** 锚点为矩形的左上角 **/

	/**
	 * x坐标的setter和getter。分为固定定位/相对定位，靠左/靠右
	 * */
	Object.defineProperty(CoreComment.prototype, "x", {
		get: function () {
			if (this._x === null || this._x === undefined) {
				if (this.align % 2 === 0) {
					this._x = this.dom.offsetLeft;
				} else {
					this._x = this.parent.width - this.dom.offsetLeft - this.width;
				}
			}
			if (!this.absolute) {
				return this._x / this.parent.width;
			}
			return this._x;
		},
		set: function (x) {
			this._x = x;
			if (!this.absolute) {
				this._x *= this.parent.width;
			}
			if (this.align % 2 === 0) {
				this.dom.style.left = this._x + "px";
			} else {
				this.dom.style.right = this._x + "px";
			}
		},
		enumerable: true,
		configurable: true
	});

	/**
	 * y坐标的setter和getter。分为固定定位/相对定位，靠上/靠下
	 * */
	Object.defineProperty(CoreComment.prototype, "y", {
		get: function () {
			if (this._y === null || this._y === undefined) {
				if (this.align < 2) {
					this._y = this.dom.offsetTop;
				} else {
					this._y = this.parent.height - this.dom.offsetTop - this.height;
				}
			}
			if (!this.absolute) {
				return this._y / this.parent.height;
			}
			return this._y;
		},
		set: function (y) {
			this._y = y;
			if (!this.absolute) {
				this._y *= this.parent.height;
			}
			if (this.align < 2) {
				this.dom.style.top = this._y + "px";
			} else {
				this.dom.style.bottom = this._y + "px";
			}
		},
		enumerable: true,
		configurable: true
	});

	/**
	 * bottom属性为y坐标+高度（即靠屏幕底部的一边）
	 * */
	Object.defineProperty(CoreComment.prototype, "bottom", {
		get: function () {
			return this.y + this.height;
		},
		enumerable: true,
		configurable: true
	});

	/**
	 * right属性为x坐标+宽度（即靠屏幕右侧的一边）
	 * */
	Object.defineProperty(CoreComment.prototype, "right", {
		get: function () {
			return this.x + this.width;
		},
		enumerable: true,
		configurable: true
	});

	/**
	 * width宽度的setter和getter
	 * */
	Object.defineProperty(CoreComment.prototype, "width", {
		get: function () {
			if (this._width === null || this._width === undefined) {
				this._width = this.dom.offsetWidth;
			}
			return this._width;
		},
		set: function (w) {
			this._width = w;
			this.dom.style.width = this._width + "px";
		},
		enumerable: true,
		configurable: true
	});

	/**
	 * height高度的setter和getter
	 * */
	Object.defineProperty(CoreComment.prototype, "height", {
		get: function () {
			if (this._height === null || this._height === undefined) {
				this._height = this.dom.offsetHeight;
			}
			return this._height;
		},
		set: function (h) {
			this._height = h;
			this.dom.style.height = this._height + "px";
		},
		enumerable: true,
		configurable: true
	});

	/**
	 * size字体大小的setter和getter
	 * */
	Object.defineProperty(CoreComment.prototype, "size", {
		get: function () {
			return this._size;
		},
		set: function (s) {
			this._size = s;
			this.dom.style.fontSize = this._size + "px";
		},
		enumerable: true,
		configurable: true
	});

	/**
	 * color颜色属性的setter和getter
	 * */
	Object.defineProperty(CoreComment.prototype, "color", {
		get: function () {
			return this._color;
		},
		set: function (c) {
			this._color = c;
			var color = c.toString(16);
			color = color.length >= 6 ? color : new Array(6 - color.length + 1).join("0") + color;
			this.dom.style.color = "#" + color;
			if (this._color === 0) {
				this.dom.className = this.parent.options.global.className + " rshadow";
			}
		},
		enumerable: true,
		configurable: true
	});

	/**
	 * alpha透明度属性的setter和getter
	 * */
	Object.defineProperty(CoreComment.prototype, "alpha", {
		get: function () {
			return this._alpha;
		},
		set: function (a) {
			this._alpha = a;
			this.dom.style.opacity = Math.min(this._alpha, this.parent.options.global.opacity) + "";
		},
		enumerable: true,
		configurable: true
	});


	/**
	 * border边界属性的setter和getter
	 * */
	Object.defineProperty(CoreComment.prototype, "border", {
		get: function () {
			return this._border;
		},
		set: function (b) {
			this._border = b;
			if (this._border) {
				this.dom.style.border = "1px solid #00ffff";
			} else {
				this.dom.style.border = "none";
			}
		},
		enumerable: true,
		configurable: true
	});

	Object.defineProperty(CoreComment.prototype, "shadow", {
		get: function () {
			return this._shadow;
		},
		set: function (s) {
			this._shadow = s;
			if (!this._shadow) {
				this.dom.className = this.parent.options.global.className + " noshadow";
			}
		},
		enumerable: true,
		configurable: true
	});

	Object.defineProperty(CoreComment.prototype, "font", {
		get: function () {
			return this._font;
		},
		set: function (f) {
			this._font = f;
			if (this._font.length > 0) {
				this.dom.style.fontFamily = this._font;
			} else {
				this.dom.style.fontFamily = "";
			}
		},
		enumerable: true,
		configurable: true
	});
	/** 以上是CoreComment的属性定义 **/










	CoreComment.prototype.time = function (time) {
		this.ttl -= time;
		if (this.ttl < 0) {
			this.ttl = 0;
		}
		if (this.movable) {
			this.update();
		}
		if (this.ttl <= 0) {
			this.finish();
		}
	};

	CoreComment.prototype.update = function () {
		this.animate();
	};

	CoreComment.prototype.invalidate = function () {
		this._x = null;
		this._y = null;
		this._width = null;
		this._height = null;
	};

	CoreComment.prototype._execMotion = function (currentMotion, time) {
		for (var prop in currentMotion) {
			if (currentMotion.hasOwnProperty(prop)) {
				var m = currentMotion[prop];
				this[prop] = m.easing(Math.min(Math.max(time - m.delay, 0), m.dur), m.from, m.to - m.from, m.dur);
			}
		}
	};

	/**
	 * 画出弹幕的淡入淡出效果？？？
	 */
	CoreComment.prototype.animate = function () {
		if (this._alphaMotion) {
			this.alpha = (this.dur - this.ttl) * (this._alphaMotion["to"] - this._alphaMotion["from"]) / this.dur + this._alphaMotion["from"];
		}
		if (this.motion.length === 0) {
			return;
		}
		var ttl = Math.max(this.ttl, 0);
		var time = (this.dur - ttl) - this._motionStart[this._curMotion];
		this._execMotion(this.motion[this._curMotion], time);
		if (this.dur - ttl > this._motionEnd[this._curMotion]) {
			this._curMotion++;
			if (this._curMotion >= this.motion.length) {
				this._curMotion = this.motion.length - 1;
			}
			return;
		}
	};

	CoreComment.prototype.finish = function () {
		this.parent.finish(this);
	};

	CoreComment.prototype.toString = function () {
		return ["[", this.stime, "|", this.ttl, "/", this.dur, "]", "(", this.mode, ")", this.text].join("");
	};

	CoreComment.prototype.toJson = function () {
		var obj = {};
		obj.stime = this.stime;
		obj.mode = this.mode;
		obj.text = this.text;
		obj.color = this.color;
		return JSON.stringify(obj);
	}

	CoreComment.LINEAR = function (t, b, c, d) {
		return t * c / d + b;
	};
	return CoreComment;
})();


/**
 * 针对滚动弹幕。
 */
var ScrollComment = (function (_super) {
	__extends(ScrollComment, _super);
	function ScrollComment(parent, data) {
		_super.call(this, parent, data);
		this.dur *= this.parent.options.scroll.scale;
		this.ttl *= this.parent.options.scroll.scale;
	}
	Object.defineProperty(ScrollComment.prototype, "alpha", {
		set: function (a) {
			this._alpha = a;
			this.dom.style.opacity = Math.min(Math.min(this._alpha, this.parent.options.global.opacity), this.parent.options.scroll.opacity) + "";
		},
		enumerable: true,
		configurable: true
	});

	ScrollComment.prototype.init = function (recycle) {
		if (typeof recycle === "undefined") { recycle = null; }
		_super.prototype.init.call(this, recycle);
		this.x = this.parent.width;
		if (this.parent.options.scroll.opacity < 1) {
			this.alpha = this._alpha;
		}
		this.absolute = true;
	};

	ScrollComment.prototype.update = function () {
		this.x = (this.ttl / this.dur) * (this.parent.width + this.width) - this.width;
	};
	return ScrollComment;
})(CoreComment);

function CommentFilter(){
	this.patterns = [];	/** patterns数组中包含一系列要屏蔽的关键词 **/
	this.modifiers = [];
	this.runtime = null;
	this.allowTypes = {
		"1":true,
		"4":true,
		"5":true,
		"6":true,
		"7":true,
		"8":true,
		"17":true
	};
	/** Regex 过滤文本中的关键词 **/
	this.filterKeywords = function (cmtData) {
		for (var patt in this.patterns) {
			var pattern = new RegExp(this.patterns[patt], "g");
			// console.log("pattern and text");
			// console.log(this.patterns[patt]);
			// console.log(cmtData);
			if (pattern.test(cmtData)) {
				return false;
			}
		}
		// console.log("patterns data" + cmtData);
		// console.log(this.patterns);
		return true;
	};
	this.doModify = function(cmt){
		for(var k=0;k<this.modifiers.length;k++){
			cmt = this.modifiers[k](cmt);
		}
		return cmt;
	};
	this.beforeSend = function(cmt){
		return cmt;
	};
	this.doValidate = function(cmtData){
		// console.log("doValidate ");
		// console.log(cmtData);
		if(!this.allowTypes[cmtData.mode] || !this.filterKeywords(cmtData.text))
			return false;
		return true;
	};
	/**
	 * Structure of Rule
	 * Rule {
	 *	"mode": int comment_mode,
	 *	"text": string keyword
	 * }
	 * @param rule
	 */
	this.addRule = function(rule){
		if (rule["mode"])
			this.allowTypes[rule["mode"]] = false;
		if (rule["text"])
			this.patterns.push(rule["text"]);
		// console.log(this.patterns);
	};
	this.addModifier = function(f){
		this.modifiers.push(f);
	};
	this.runtimeFilter = function(cmt){
		if(this.runtime == null)
			return cmt;
		return this.runtime(cmt);
	};
	this.setRuntimeFilter = function(f){
		this.runtime = f;
	};
}

/**
 * Comment Core Library CommentManager
 * @license MIT
 * @author Jim Chen
 *
 * Copyright (c) 2014 Jim Chen
 */
var CommentManager = (function() {
	/**
	 * 获得转换矩阵
	 * @param yrot
	 * @param zrot
	 * @returns {string}
	 */
	var getRotMatrix = function(yrot, zrot) {
		// Courtesy of @StarBrilliant, re-adapted to look better
		var DEG2RAD = Math.PI/180;
		var yr = yrot * DEG2RAD;
		var zr = zrot * DEG2RAD;
		var COS = Math.cos;
		var SIN = Math.sin;
		var matrix = [
			COS(yr) * COS(zr)    , COS(yr) * SIN(zr)     , SIN(yr)  , 0,
			(-SIN(zr))           , COS(zr)               , 0        , 0,
			(-SIN(yr) * COS(zr)) , (-SIN(yr) * SIN(zr))  , COS(yr)  , 0,
			0                    , 0                     , 0        , 1
		];
		// CSS does not recognize scientific notation (e.g. 1e-6), truncating it.
		for(var i = 0; i < matrix.length;i++){
			if(Math.abs(matrix[i]) < 0.000001){
				matrix[i] = 0;
			}
		}
		return "matrix3d(" + matrix.join(",") + ")";
	};

	function CommentManager(stageObject){
		var __timer = 0;

		this._listeners = {};
		this._lastPosition = 0;

		this.stage = stageObject;
		this.options = {
			global:{
				opacity:1,
				scale:1,
				className:"cmt"
			},
			scroll:{
				opacity:1,
				scale:1
			},
			limit: 0
		};
		this.timeline = [];
		this.runline = [];
		this.position = 0;
		this.limiter = 0;
		this.filter = null;
		this.csa = {
			scroll: new CommentSpaceAllocator(0,0),
			top:new AnchorCommentSpaceAllocator(0,0),
			bottom:new AnchorCommentSpaceAllocator(0,0),
			reverse:new CommentSpaceAllocator(0,0),
			scrollbtm:new CommentSpaceAllocator(0,0)
		};

		/** Precompute the offset width **/
		this.width = this.stage.offsetWidth;	//stage即HTMLDivElement
		this.height = this.stage.offsetHeight;
		this.startTimer = function(){
			// console.log("start timer");
			// console.log(JSON.stringify(this.timeline));
			if(__timer > 0)
				return;
			var lastTPos = new Date().getTime();
			var cmMgr = this;
			__timer = window.setInterval(function(){
				var elapsed = new Date().getTime() - lastTPos;
				lastTPos = new Date().getTime();
				cmMgr.onTimerEvent(elapsed,cmMgr);
			},10);
		};
		this.stopTimer = function(){
			window.clearInterval(__timer);
			__timer = 0;
		};
	}

	/** Public **/
	CommentManager.prototype.stop = function(){
		this.stopTimer();
	};

	CommentManager.prototype.start = function(){
		this.startTimer();
	};

	CommentManager.prototype.seek = function(time){
		this.position = BinArray.bsearch(this.timeline, time, function(a,b){
			if(a < b.stime) return -1;
			else if(a > b.stime) return 1;
			else return 0;
		});
	};

	CommentManager.prototype.validate = function(cmt){
		if(cmt == null)
			return false;
		return this.filter.doValidate(cmt);
	};

	CommentManager.prototype.addRules = function (rule) {
		this.filter.addRule(rule);
	};

	/**
	 * 按时间线排序后加载弹幕
	 * @param a
	 */
	CommentManager.prototype.load = function(a){
		this.timeline = a;
		this.timeline.sort(function(a,b){
			if(a.stime > b.stime) return 2;
			else if(a.stime < b.stime) return -2;
			else{
				if(a.date > b.date) return 1;
				else if(a.date < b.date) return -1;
				else if(a.dbid != null && b.dbid != null){
					if(a.dbid > b.dbid) return 1;
					else if(a.dbid < b.dbid) return -1;
					return 0;
				}else
					return 0;
			}
		});
		this.dispatchEvent("load");
	};

	CommentManager.prototype.insert = function(c){
		var index = BinArray.binsert(this.timeline, c, function(a,b){
			if(a.stime > b.stime) return 2;
			else if(a.stime < b.stime) return -2;
			else {
				if(a.date > b.date) return 1;
				else if(a.date < b.date) return -1;
				else if(a.dbid != null && b.dbid != null){
					if(a.dbid > b.dbid) return 1;
					else if(a.dbid < b.dbid) return -1;
					return 0;
				} else
					return 0;
			}
		});
		if(index <= this.position){
			this.position++;
		}
		this.dispatchEvent("insert");
		console.log(this.timeline);
	};

	CommentManager.prototype.clear = function(){
		while(this.runline.length > 0){
			this.runline[0].finish();
		}
		this.dispatchEvent("clear");
	};

	CommentManager.prototype.setBounds = function(){
		this.width = this.stage.offsetWidth;
		this.height= this.stage.offsetHeight;
		this.dispatchEvent("resize");
		for(var comAlloc in this.csa){
			this.csa[comAlloc].setBounds(this.width,this.height);
		}
		// Update 3d perspective
		this.stage.style.perspective = this.width * Math.tan(40 * Math.PI/180) / 2 + "px";
		this.stage.style.webkitPerspective = this.width * Math.tan(40 * Math.PI/180) / 2 + "px";
	};
	CommentManager.prototype.init = function(){
		this.setBounds();
		if(this.filter == null) {
			this.filter = new CommentFilter(); //Only create a filter if none exist
		}
	};
	CommentManager.prototype.time = function(time){
		time = time - 1;
		if(this.position >= this.timeline.length || Math.abs(this._lastPosition - time) >= 2000){
			this.seek(time);
			this._lastPosition = time;
			if(this.timeline.length <= this.position) {
				return;
			}
		}else{
			this._lastPosition = time;
		}
		for(;this.position < this.timeline.length;this.position++){
			if(this.timeline[this.position]['stime']<=time){
				if(this.options.limit > 0 && this.runline.length > this.limiter) {
					continue; // Skip comments but still move the position pointer
				} else if(this.validate(this.timeline[this.position])){
					this.send(this.timeline[this.position]);
				}
			}else{
				break;
			}
		}
	};
	CommentManager.prototype.rescale = function(){

	};
	CommentManager.prototype.send = function(data){
		if(data.mode === 8){
			console.log(data);
			if(this.scripting){
				console.log(this.scripting.eval(data.code));
			}
			return;
		}
		if(this.filter != null){
			data = this.filter.doModify(data);
			if(data == null) return;
		}
		if(data.mode === 1 || data.mode === 2 || data.mode === 6){
			var cmt = new ScrollComment(this, data);
		}else{
			var cmt = new CoreComment(this, data);
		}
		switch(cmt.mode){
			case 1:cmt.align = 0;break;
			case 2:cmt.align = 2;break;
			case 4:cmt.align = 2;break;
			case 5:cmt.align = 0;break;
			case 6:cmt.align = 1;break;
		}
		cmt.init();
		this.stage.appendChild(cmt.dom);
		switch(cmt.mode){
			default:
			case 1:{this.csa.scroll.add(cmt);}break;
			case 2:{this.csa.scrollbtm.add(cmt);}break;
			case 4:{this.csa.bottom.add(cmt);}break;
			case 5:{this.csa.top.add(cmt);}break;
			case 6:{this.csa.reverse.add(cmt);}break;
			case 17:
			case 7:{
				if(data.rY !== 0 || data.rZ !== 0){
					/** TODO: revise when browser manufacturers make up their mind on Transform APIs **/
					cmt.dom.style.transform = getRotMatrix(data.rY, data.rZ);
					cmt.dom.style.webkitTransform = getRotMatrix(data.rY, data.rZ);
					cmt.dom.style.OTransform = getRotMatrix(data.rY, data.rZ);
					cmt.dom.style.MozTransform = getRotMatrix(data.rY, data.rZ);
					cmt.dom.style.MSTransform = getRotMatrix(data.rY, data.rZ);
				}
			}break;
		}
		cmt.y = cmt.y;
		this.dispatchEvent("enterComment", cmt);
		this.runline.push(cmt);
	};
	CommentManager.prototype.sendComment = function(data){
		console.log("CommentManager.sendComment is deprecated. Please use send instead");
		this.send(data); // Wrapper for Backwards Compatible APIs
	};
	CommentManager.prototype.finish = function(cmt){
		this.dispatchEvent("exitComment", cmt);
		this.stage.removeChild(cmt.dom);
		var index = this.runline.indexOf(cmt);
		if(index >= 0){
			this.runline.splice(index, 1);
		}
		switch(cmt.mode){
			default:
			case 1:{this.csa.scroll.remove(cmt);}break;
			case 2:{this.csa.scrollbtm.remove(cmt);}break;
			case 4:{this.csa.bottom.remove(cmt);}break;
			case 5:{this.csa.top.remove(cmt);}break;
			case 6:{this.csa.reverse.remove(cmt);}break;
			case 7:break;
		}
	};
	/**
	 * 添加事件监听
	 * @param event
	 * @param listener
	 */
	CommentManager.prototype.addEventListener = function(event, listener){
		if(typeof this._listeners[event] !== "undefined"){
			this._listeners[event].push(listener);
		}else{
			this._listeners[event] = [listener];
		}
	};
	/**
	 * 将data传入event的每个元素并执行
	 * @param event
	 * @param data
	 */
	CommentManager.prototype.dispatchEvent = function(event, data){
		if(typeof this._listeners[event] !== "undefined"){
			for(var i = 0; i < this._listeners[event].length; i++){
				try{
					this._listeners[event][i](data);
				}catch(e){
					console.err(e.stack);
				}
			}
		}
	};
	/** Static Functions **/
	CommentManager.prototype.onTimerEvent = function(timePassed,cmObj){
		for(var i= 0;i < cmObj.runline.length; i++){
			var cmt = cmObj.runline[i];
			if(cmt.hold){
				continue;
			}
			cmt.time(timePassed);
		}
	};
	return CommentManager;
})();
