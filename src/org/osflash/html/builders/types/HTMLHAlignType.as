package org.osflash.html.builders.types
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLHAlignType
	{
		
		public static const LEFT : HTMLHAlignType = new HTMLHAlignType('left');
		
		public static const RIGHT : HTMLHAlignType = new HTMLHAlignType('right');
		
		public static const CENTER : HTMLHAlignType = new HTMLHAlignType('center');
		
		public static const JUSTIFY : HTMLHAlignType = new HTMLHAlignType('justify');
		
		/**
		 * @private
		 */
		private var _type : String;

		/**
		 * @private
		 */
		private var _name : String;

		public function HTMLHAlignType(type : String)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(type.length == 0) throw new ArgumentError('Type can not be empty');
			
			_type = type;
		}
		
		public static function typeAsString(type : HTMLHAlignType) : String
		{
			switch(type)
			{
				case LEFT:
				case RIGHT:
				case CENTER:
				case JUSTIFY:
					return type.type;
				default: 
					throw new ArgumentError('Unknown HTMLHAlignType found');
			}
		}
		
		public function get name() : String
		{
			if(null == _name) _name = typeAsString(this);
			return _name; 
		}
  		
		public function get type() : String { return _type; }
	}
}
