package org.osflash.css.types
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class CSSPositionType
	{
		
		public static const STATIC : CSSPositionType = new CSSPositionType('static');
		
		public static const ABSOLUTE : CSSPositionType = new CSSPositionType('absolute');
		
		public static const FIXED : CSSPositionType = new CSSPositionType('fixed');
		
		public static const RELATIVE : CSSPositionType = new CSSPositionType('relative');
		
		public static const INHERIT : CSSPositionType = new CSSPositionType('inherit');
		
		/**
		 * @private
		 */
		private var _type : String;

		/**
		 * @private
		 */
		private var _name : String;

		public function CSSPositionType(type : String)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(type.length == 0) throw new ArgumentError('Type can not be empty');
			
			_type = type;
		}
		
		public static function typeAsString(type : CSSPositionType) : String
		{
			switch(type)
			{
				case STATIC:
				case ABSOLUTE:
				case FIXED:
				case RELATIVE:
				case INHERIT:
					return type.type;
				default: 
					throw new ArgumentError('Unknown CSSPositionType found');
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
