package org.osflash.html.builders.types
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLMediaType
	{
		
		public static const SCREEN : HTMLMediaType = new HTMLMediaType('screen');
		
		public static const TTY : HTMLMediaType = new HTMLMediaType('tty');
		
		public static const TV : HTMLMediaType = new HTMLMediaType('tv');
		
		public static const PROJECTION : HTMLMediaType = new HTMLMediaType('projection');
		
		public static const HANDHELD : HTMLMediaType = new HTMLMediaType('handheld');
		
		public static const PRINT : HTMLMediaType = new HTMLMediaType('print');
		
		public static const BRAILLE : HTMLMediaType = new HTMLMediaType('braille');
		
		public static const AURAL : HTMLMediaType = new HTMLMediaType('aural');
		
		public static const ALL : HTMLMediaType = new HTMLMediaType('all');
		
		/**
		 * @private
		 */
		private var _type : String;

		/**
		 * @private
		 */
		private var _name : String;

		public function HTMLMediaType(type : String)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(type.length == 0) throw new ArgumentError('Type can not be empty');
			
			_type = type;
		}
		
		public static function typeAsString(type : HTMLMediaType) : String
		{
			switch(type)
			{
				case SCREEN:
				case TTY:
				case TV:
				case PROJECTION:
				case HANDHELD:
				case PRINT:
				case BRAILLE:
				case AURAL:
				case ALL: 
					return type.type;
				default: 
					throw new ArgumentError('Unknown HTMLMediaType found');
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
