package org.osflash.css.geom
{
	import org.osflash.css.data.CSSConvertableValue;
	import org.osflash.stream.IStreamOutput;
	import org.osflash.stream.IStreamWriter;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class CSSRectangle implements IStreamWriter
	{
		/**
		 * @private
		 */
		private var _top : CSSConvertableValue;
		
		/**
		 * @private
		 */
		private var _right : CSSConvertableValue;
		
		/**
		 * @private
		 */
		private var _bottom : CSSConvertableValue;
		
		/**
		 * @private
		 */
		private var _left : CSSConvertableValue;

		public function CSSRectangle()
		{
			_top = new CSSConvertableValue();
			_right = new CSSConvertableValue();
			_bottom = new CSSConvertableValue();
			_left = new CSSConvertableValue();
		}
		
		public function setValues(...rest) : void
		{
			const total : int = rest.length;
			if(total == 1)
			{
				top = rest[0];
				right = rest[0];
				bottom = rest[0];
				left = rest[0];
			}
			else if(total == 2)
			{
				top = rest[0];
				right = rest[1];
				bottom = rest[0];
				left = rest[1];
			}
			else if(total == 4)
			{
				top = rest[0];
				right = rest[1];
				bottom = rest[2];
				left = rest[3];
			}
			else throw new ArgumentError('Invalid number of arguments sent');
		}
		
		/**
		 * @inheritDoc
		 */
		public function write(stream : IStreamOutput) : void
		{
			stream.writeUTF('rect(' + top + ', ' + right + ', ' + bottom + ', '  + left + ')');
		}
		
		public function hasValidProperties() : Boolean
		{
			return null != top || null != right || null != bottom || null != left;
		}
		
		public function get top() : * { return _top.value; }
		public function set top(value : *) : void { _top.value = value; }

		public function get right() : * { return _right.value; }
		public function set right(value : *) : void { _right.value = value; }

		public function get bottom() : * { return _bottom.value; }
		public function set bottom(value : *) : void { _bottom.value = value; }

		public function get left() : * { return _left.value; }
		public function set left(value : *) : void { _left.value = value; }
	}
}
