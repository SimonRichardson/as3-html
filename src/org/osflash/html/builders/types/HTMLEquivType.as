package org.osflash.html.builders.types
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLEquivType
	{
		
		public static const CACHE_CONTROL : HTMLEquivType = new HTMLEquivType('cache-control');
		
		public static const CONTENT_LANG : HTMLEquivType = new HTMLEquivType('content-language');
		
		public static const CONTENT_TYPE : HTMLEquivType = new HTMLEquivType('content-type');
		
		public static const DATE : HTMLEquivType = new HTMLEquivType('date');
		
		public static const EXPIRES : HTMLEquivType = new HTMLEquivType('expires');
		
		public static const LAST_MODIFIED : HTMLEquivType = new HTMLEquivType('last-modified');
		
		public static const LOCATION : HTMLEquivType = new HTMLEquivType('location');
		
		public static const REFRESH : HTMLEquivType = new HTMLEquivType('refresh');
		
		public static const SET_COOKIE : HTMLEquivType = new HTMLEquivType('set-cookie');
		
		public static const WINDOW_TARGET : HTMLEquivType = new HTMLEquivType('window-target');
		
		/**
		 * @private
		 */
		private var _type : String;

		/**
		 * @private
		 */
		private var _name : String;

		public function HTMLEquivType(type : String)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(type.length == 0) throw new ArgumentError('Type can not be empty');
			
			_type = type;
		}
		
		public static function typeAsString(type : HTMLEquivType) : String
		{
			switch(type)
			{
				case CACHE_CONTROL:
				case CONTENT_LANG:
				case CONTENT_TYPE:
				case DATE:
				case EXPIRES:
				case LAST_MODIFIED:
				case LOCATION:
				case REFRESH:
				case SET_COOKIE:
				case WINDOW_TARGET:
					return type.type;
				default: 
					throw new ArgumentError('Unknown HTMLEquivType found');
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
