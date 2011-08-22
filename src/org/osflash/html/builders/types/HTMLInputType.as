package org.osflash.html.builders.types
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLInputType
	{
		
		public static const BUTTON : HTMLInputType = new HTMLInputType('button');
		
		public static const CHECKBOX : HTMLInputType = new HTMLInputType('reset');
		
		public static const FILE : HTMLInputType = new HTMLInputType('file');
		
		public static const HIDDEN : HTMLInputType = new HTMLInputType('hidden');
		
		public static const IMAGE : HTMLInputType = new HTMLInputType('image');
		
		public static const PASSWORD : HTMLInputType = new HTMLInputType('password');
		
		public static const RADIO : HTMLInputType = new HTMLInputType('radio');
		
		public static const RESET : HTMLInputType = new HTMLInputType('reset');
		
		public static const SUBMIT : HTMLInputType = new HTMLInputType('submit');
		
		public static const TEXT : HTMLInputType = new HTMLInputType('text');
		
		/**
		 * @private
		 */
		private var _type : String;

		/**
		 * @private
		 */
		private var _name : String;

		public function HTMLInputType(type : String)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(type.length == 0) throw new ArgumentError('Type can not be empty');
			
			_type = type;
		}
		
		public static function typeAsString(type : HTMLInputType) : String
		{
			switch(type)
			{
				case BUTTON:
				case CHECKBOX:
				case FILE:
				case HIDDEN:
				case IMAGE:
				case PASSWORD:
				case RADIO:
				case RESET:
				case SUBMIT:
				case TEXT:
					return type.type;
				default: 
					throw new ArgumentError('Unknown HTMLInputType found');
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
