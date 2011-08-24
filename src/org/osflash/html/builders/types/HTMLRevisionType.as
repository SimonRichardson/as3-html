package org.osflash.html.builders.types
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLRevisionType
	{
		
		public static const HTML_4 : HTMLRevisionType = new HTMLRevisionType('html4');
		
		public static const HTML_5 : HTMLRevisionType = new HTMLRevisionType('html5');
		
		/**
		 * @private
		 */
		private var _type : String;

		/**
		 * @private
		 */
		private var _name : String;

		public function HTMLRevisionType(type : String)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(type.length == 0) throw new ArgumentError('Type can not be empty');
			
			_type = type;
		}
		
		public static function typeAsString(type : HTMLRevisionType) : String
		{
			switch(type)
			{
				case HTML_4:
				case HTML_5:
					return type.type;
				default: 
					throw new ArgumentError('Unknown HTMLRevisionType found');
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
