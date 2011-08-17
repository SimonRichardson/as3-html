package org.osflash.html.builders.types.meta
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLMetaCacheContentType
	{
		public static const PUBLIC : HTMLMetaCacheContentType = 
															new HTMLMetaCacheContentType('public');
		
		public static const PRIVATE : HTMLMetaCacheContentType = 
															new HTMLMetaCacheContentType('private');
		
		public static const NO_CACHE : HTMLMetaCacheContentType = 
														new HTMLMetaCacheContentType('no-cache');
															
		public static const NO_STORE : HTMLMetaCacheContentType = 
														new HTMLMetaCacheContentType('no-store');
		
		/**
		 * @private
		 */
		private var _type : String;

		/**
		 * @private
		 */
		private var _name : String;

		public function HTMLMetaCacheContentType(type : String)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(type.length == 0) throw new ArgumentError('Type can not be empty');
			
			_type = type;
		}
		
		public static function typeAsString(type : HTMLMetaCacheContentType) : String
		{
			switch(type)
			{
				case PUBLIC:
				case PRIVATE:
				case NO_CACHE:
				case NO_STORE:
					return type.type;
				default: 
					throw new ArgumentError('Unknown HTMLMetaCacheContentType found');
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
