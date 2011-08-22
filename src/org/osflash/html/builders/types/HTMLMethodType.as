package org.osflash.html.builders.types
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLMethodType
	{
		
		public static const GET : HTMLMethodType = new HTMLMethodType('get');
		
		public static const POST : HTMLMethodType = new HTMLMethodType('post');
		
		public static const DELETE : HTMLMethodType = new HTMLMethodType('delete');
		
		public static const UPDATE : HTMLMethodType = new HTMLMethodType('update');
		
		/**
		 * @private
		 */
		private var _type : String;

		/**
		 * @private
		 */
		private var _name : String;

		public function HTMLMethodType(type : String)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(type.length == 0) throw new ArgumentError('Type can not be empty');
			
			_type = type;
		}
		
		public static function typeAsString(type : HTMLMethodType) : String
		{
			switch(type)
			{
				case GET:
				case POST:
				case DELETE:
				case UPDATE:
					return type.type;
				default: 
					throw new ArgumentError('Unknown HTMLMethodType found');
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
