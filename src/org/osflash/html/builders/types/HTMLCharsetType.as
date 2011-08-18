package org.osflash.html.builders.types
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLCharsetType
	{
		
		public static const UTF_8 : HTMLCharsetType = new HTMLCharsetType('UTF-8');
		
		public static const ISO_8859_1 : HTMLCharsetType = new HTMLCharsetType('ISO-8859-1');
		
		/**
		 * @private
		 */
		private var _type : String;

		/**
		 * @private
		 */
		private var _name : String;

		public function HTMLCharsetType(type : String)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(type.length == 0) throw new ArgumentError('Type can not be empty');
			
			_type = type;
		}
		
		public static function typeAsString(type : HTMLCharsetType) : String
		{
			switch(type)
			{
				case UTF_8:
				case ISO_8859_1:
					return type.type;
				default: 
					throw new ArgumentError('Unknown HTMLCharsetType found');
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
