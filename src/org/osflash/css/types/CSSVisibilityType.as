package org.osflash.css.types
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class CSSVisibilityType
	{
		
		public static const VISIBLE : CSSVisibilityType = new CSSVisibilityType('visible');
		
		public static const HIDDEN : CSSVisibilityType = new CSSVisibilityType('hidden');
		
		public static const INHERIT : CSSVisibilityType = new CSSVisibilityType('inherit');
		
		/**
		 * @private
		 */
		private var _type : String;

		/**
		 * @private
		 */
		private var _name : String;

		public function CSSVisibilityType(type : String)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(type.length == 0) throw new ArgumentError('Type can not be empty');
			
			_type = type;
		}
		
		public static function typeAsString(type : CSSVisibilityType) : String
		{
			switch(type)
			{
				case VISIBLE:
				case HIDDEN:
				case INHERIT:
					return type.type;
				default: 
					throw new ArgumentError('Unknown CSSVisibilityType found');
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
