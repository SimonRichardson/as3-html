package org.osflash.css.types
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class CSSBackgroundRepeatType
	{
		
		public static const REPEAT : CSSBackgroundRepeatType = 
														new CSSBackgroundRepeatType('repeat');
		
		public static const REPEAT_X : CSSBackgroundRepeatType = 
														new CSSBackgroundRepeatType('repeat-x');
		
		public static const REPEAT_Y : CSSBackgroundRepeatType = 
														new CSSBackgroundRepeatType('repeat-y');
		
		public static const NO_REPEAT : CSSBackgroundRepeatType = 
														new CSSBackgroundRepeatType('no-repeat');
		
		public static const INHERIT : CSSBackgroundRepeatType = 
														new CSSBackgroundRepeatType('inherit');
		
		/**
		 * @private
		 */
		private var _type : String;

		/**
		 * @private
		 */
		private var _name : String;

		public function CSSBackgroundRepeatType(type : String)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(type.length == 0) throw new ArgumentError('Type can not be empty');
			
			_type = type;
		}
		
		public static function typeAsString(type : CSSBackgroundRepeatType) : String
		{
			switch(type)
			{
				case REPEAT:
				case REPEAT_X:
				case REPEAT_Y:
				case NO_REPEAT:
				case INHERIT:
					return type.type;
				default: 
					throw new ArgumentError('Unknown CSSBackgroundRepeatType found');
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
