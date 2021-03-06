package org.osflash.html.builders.types
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLMIMEType
	{
		
		public static const TEXT_HTML : HTMLMIMEType = new HTMLMIMEType('text/html');
		
		public static const TEXT_CSS : HTMLMIMEType = new HTMLMIMEType('text/css');
		
		public static const TEXT_JAVASCRIPT : HTMLMIMEType = new HTMLMIMEType('text/javascript');
		
		/**
		 * @private
		 */
		private var _type : String;

		/**
		 * @private
		 */
		private var _name : String;

		public function HTMLMIMEType(type : String)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(type.length == 0) throw new ArgumentError('Type can not be empty');
			
			_type = type;
		}
		
		public static function typeAsString(type : HTMLMIMEType) : String
		{
			switch(type)
			{
				case TEXT_HTML:
				case TEXT_CSS:
				case TEXT_JAVASCRIPT: 
					return type.type;
				default: 
					throw new ArgumentError('Unknown HTMLMIMEType found');
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
