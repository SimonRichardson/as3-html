package org.osflash.css.types
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class CSSOverflowType
	{
		
		public static const VISIBLE : CSSOverflowType = new CSSOverflowType('visible');
		
		public static const HIDDEN : CSSOverflowType = new CSSOverflowType('hidden');
		
		public static const SCROLL : CSSOverflowType = new CSSOverflowType('scroll');
		
		public static const AUTO : CSSOverflowType = new CSSOverflowType('auto');
		
		public static const INHERIT : CSSOverflowType = new CSSOverflowType('inherit');
		
		/**
		 * @private
		 */
		private var _type : String;

		/**
		 * @private
		 */
		private var _name : String;

		public function CSSOverflowType(type : String)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(type.length == 0) throw new ArgumentError('Type can not be empty');
			
			_type = type;
		}
		
		public static function typeAsString(type : CSSOverflowType) : String
		{
			switch(type)
			{
				case VISIBLE:
				case HIDDEN:
				case SCROLL:
				case AUTO:
				case INHERIT:
					return type.type;
				default: 
					throw new ArgumentError('Unknown CSSOverflowType found');
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
