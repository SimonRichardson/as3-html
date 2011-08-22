package org.osflash.html.builders.types
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLEncodeType
	{
		
		public static const TEXT_PLAIN : HTMLEncodeType = new HTMLEncodeType('text/plain');
		
		public static const MULTIPART_FORM_DATA : HTMLEncodeType = 
														new HTMLEncodeType('multipart/form-data');
		
		public static const APP_X_WWW_FORM_URL_ENCODED : HTMLEncodeType = 
										new HTMLEncodeType('application/x-www-form-urlencoded');
		
		/**
		 * @private
		 */
		private var _type : String;

		/**
		 * @private
		 */
		private var _name : String;

		public function HTMLEncodeType(type : String)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(type.length == 0) throw new ArgumentError('Type can not be empty');
			
			_type = type;
		}
		
		public static function typeAsString(type : HTMLEncodeType) : String
		{
			switch(type)
			{
				case TEXT_PLAIN:
				case MULTIPART_FORM_DATA:
				case APP_X_WWW_FORM_URL_ENCODED:
					return type.type;
				default: 
					throw new ArgumentError('Unknown HTMLEncodeType found');
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
