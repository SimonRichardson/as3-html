package org.osflash.css.data
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class CSSBackground
	{
		
		/**
		 * @private
		 */
		private var _color : CSSColor;
		
		public function CSSBackground()
		{
			_color = new CSSColor();
		}
		
		public function setValues(...rest) : void
		{
			
		}
		
		public function write() : String
		{
			return '';
		}
		
		public function hasValidProperties() : Boolean
		{
			return false;
		}
		
		public function get color() : * { return _color.value; }
		public function set color(value : *) : void { _color.value = value; }
	}
}
