package org.osflash.css.types
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class CSSClearType
	{
		
		public static const LEFT : CSSClearType = new CSSClearType('left');
		
		public static const RIGHT : CSSClearType = new CSSClearType('right');
		
		public static const BOTH : CSSClearType = new CSSClearType('both');
		
		public static const NONE : CSSClearType = new CSSClearType('none');
		
		public static const INHERIT : CSSClearType = new CSSClearType('inherit');
		
		/**
		 * @private
		 */
		private var _type : String;

		/**
		 * @private
		 */
		private var _name : String;

		public function CSSClearType(type : String)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(type.length == 0) throw new ArgumentError('Type can not be empty');
			
			_type = type;
		}
		
		public static function typeAsString(type : CSSClearType) : String
		{
			switch(type)
			{
				case LEFT:
				case RIGHT:
				case BOTH:
				case NONE:
				case INHERIT:
					return type.type;
				default: 
					throw new ArgumentError('Unknown CSSClearType found');
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
