package org.osflash.html.builders.types
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLButtonType
	{
		
		public static const BUTTON : HTMLButtonType = new HTMLButtonType('button');
		
		public static const RESET : HTMLButtonType = new HTMLButtonType('reset');
		
		public static const SUBMIT : HTMLButtonType = new HTMLButtonType('submit');
		
		/**
		 * @private
		 */
		private var _type : String;

		/**
		 * @private
		 */
		private var _name : String;

		public function HTMLButtonType(type : String)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(type.length == 0) throw new ArgumentError('Type can not be empty');
			
			_type = type;
		}
		
		public static function typeAsString(type : HTMLButtonType) : String
		{
			switch(type)
			{
				case BUTTON:
				case RESET:
				case SUBMIT:
					return type.type;
				default: 
					throw new ArgumentError('Unknown HTMLButtonType found');
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
