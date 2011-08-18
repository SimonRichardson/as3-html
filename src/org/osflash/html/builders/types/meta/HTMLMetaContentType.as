package org.osflash.html.builders.types.meta
{
	import org.osflash.html.builders.types.HTMLCharsetType;
	import org.osflash.html.builders.types.HTMLMIMEType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLMetaContentType
	{
		
		public static const TEXT_HTML_UTF_8 : HTMLMetaContentType = new HTMLMetaContentType(
																		'; charset=', 
																		HTMLMIMEType.TEXT_HTML, 
																		HTMLCharsetType.UTF_8
																		);
		
		public static const TEXT_HTML_ISO_8859_1 : HTMLMetaContentType = new HTMLMetaContentType(
																		'; charset=',
																		HTMLMIMEType.TEXT_HTML,
																		HTMLCharsetType.ISO_8859_1
																		);
		
		/**
		 * @private
		 */
		private var _type : String;
		
		/**
		 * @private
		 */
		private var _mimeType : HTMLMIMEType;
		
		/**
		 * @private
		 */
		private var _charsetType : HTMLCharsetType;

		/**
		 * @private
		 */
		private var _name : String;

		public function HTMLMetaContentType(	type : String, 
												mimeType : HTMLMIMEType, 
												charsetType : HTMLCharsetType
												)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(type.length == 0) throw new ArgumentError('Type can not be empty');
			if(null == mimeType) throw new ArgumentError('MimeType can not be null');
			if(null == charsetType) throw new ArgumentError('CharsetType can not be null');
			
			_type = type;
			_mimeType = mimeType;
			_charsetType = charsetType;
		}
		
		public static function typeAsString(type : HTMLMetaContentType) : String
		{
			switch(type)
			{
				case TEXT_HTML_UTF_8:
				case TEXT_HTML_ISO_8859_1:
					return type.mimeType.name + type.type + type.charsetType.name;
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
		
		public function get mimeType() : HTMLMIMEType { return _mimeType; }
		
		public function get charsetType() : HTMLCharsetType { return _charsetType; }
	}
}
