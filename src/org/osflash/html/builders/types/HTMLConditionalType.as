package org.osflash.html.builders.types
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLConditionalType
	{
		
		public static const IE : HTMLConditionalType = new HTMLConditionalType('IE');
		
		public static const IE_5 : HTMLConditionalType = new HTMLConditionalType('IE 5');
		
		public static const IE_5_0 : HTMLConditionalType = new HTMLConditionalType('IE 5.0');
		
		public static const IE_5_5 : HTMLConditionalType = new HTMLConditionalType('IE 5.5');
		
		public static const IE_6 : HTMLConditionalType = new HTMLConditionalType('IE 6');
		
		public static const IE_7 : HTMLConditionalType = new HTMLConditionalType('IE 7');
		
		public static const IE_8 : HTMLConditionalType = new HTMLConditionalType('IE 8');
		
		public static const IE_9 : HTMLConditionalType = new HTMLConditionalType('IE 9');
		
		/**
		 * @private
		 */
		private var _type : String;

		/**
		 * @private
		 */
		private var _name : String;

		public function HTMLConditionalType(type : String)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(type.length == 0) throw new ArgumentError('Type can not be empty');
			
			_type = type;
		}
		
		public static function typeAsString(type : HTMLConditionalType) : String
		{
			switch(type)
			{
				case IE:
				case IE_5:
				case IE_5_0:
				case IE_5_5:
				case IE_6:
				case IE_7:
				case IE_8:
				case IE_9:
					return type.type;
				default: 
					throw new ArgumentError('Unknown HTMLConditionalType found');
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
