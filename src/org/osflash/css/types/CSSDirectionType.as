package org.osflash.css.types
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class CSSDirectionType
	{
		
		public static const LTR : CSSDirectionType = new CSSDirectionType('ltr');
		
		public static const RTL : CSSDirectionType = new CSSDirectionType('rtl');
		
		public static const INHERIT : CSSDirectionType = new CSSDirectionType('inherit');
		
		/**
		 * @private
		 */
		private var _type : String;

		/**
		 * @private
		 */
		private var _name : String;

		public function CSSDirectionType(type : String)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(type.length == 0) throw new ArgumentError('Type can not be empty');
			
			_type = type;
		}
		
		public static function typeAsString(type : CSSDirectionType) : String
		{
			switch(type)
			{
				case LTR:
				case RTL:
				case INHERIT:
					return type.type;
				default: 
					throw new ArgumentError('Unknown CSSDirectionType found');
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
