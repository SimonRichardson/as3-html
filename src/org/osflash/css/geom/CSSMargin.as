package org.osflash.css.geom
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class CSSMargin
	{
		
		/**
		 * @private
		 */
		private var _top : Number;
		
		/**
		 * @private
		 */
		private var _right : Number;
		
		/**
		 * @private
		 */
		private var _bottom : Number;
		
		/**
		 * @private
		 */
		private var _left : Number;

		public function CSSMargin(	top : Number = 0, 
									right : Number = 0, 
									bottom : Number = 0, 
									left : Number = 0
									)
		{
			_top = top;
			_right = right;
			_bottom = bottom;
			_left = left;
		}
		
		public function write() : String
		{
			const units : String = 'px';
			return 'margin: ' + 
								top + units + ' ' + 
								right + units + ' '  + 
								bottom + units + ' '  + 
								left + units + 
								';';
		}

		public function get top() : Number { return _top; }
		public function set top(value : Number) : void { _top = value; }

		public function get right() : Number { return _right; }
		public function set right(value : Number) : void { _right = value; }

		public function get bottom() : Number { return _bottom; }
		public function set bottom(value : Number) : void { _bottom = value; }

		public function get left() : Number { return _left; }
		public function set left(value : Number) : void { _left = value; }
	}
}
