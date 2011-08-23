package org.osflash.css.types
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class CSSBackgroundImageType
	{
		public static const URL : CSSBackgroundImageType = 
														new CSSBackgroundImageType('URL');
		
		public static const NONE : CSSBackgroundImageType = 
														new CSSBackgroundImageType('none');
		
		public static const INHERIT : CSSBackgroundImageType = 
														new CSSBackgroundImageType('inherit');
		
		/**
		 * @private
		 */
		private var _type : String;

		/**
		 * @private
		 */
		private var _name : String;

		public function CSSBackgroundImageType(type : String)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(type.length == 0) throw new ArgumentError('Type can not be empty');
			
			_type = type;
		}
		
		public static function typeAsString(type : CSSBackgroundImageType) : String
		{
			switch(type)
			{
				case URL:
				case NONE:
				case INHERIT:
					return type.type;
				default: 
					throw new ArgumentError('Unknown CSSBackgroundImageType found');
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
