package org.osflash.html.builders.types.meta
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLMetaContentType
	{
		
		public static const TEXT_HTML_UTF_8 : HTMLMetaContentType = 
												new HTMLMetaContentType('text/html; charset=UTF-8');
		
		public static const TEXT_HTML_ISO_8859_1 : HTMLMetaContentType = 
										new HTMLMetaContentType('text/html; charset=iso-8859-1');
		
		/**
		 * @private
		 */
		private var _type : String;

		/**
		 * @private
		 */
		private var _name : String;

		public function HTMLMetaContentType(type : String)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(type.length == 0) throw new ArgumentError('Type can not be empty');
			
			_type = type;
		}
		
		public static function typeAsString(type : HTMLMetaContentType) : String
		{
			switch(type)
			{
				case TEXT_HTML_UTF_8:
				case TEXT_HTML_ISO_8859_1:
					return type.type;
				default: 
					throw new ArgumentError('Unknown HTMLMetaContentType found');
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
