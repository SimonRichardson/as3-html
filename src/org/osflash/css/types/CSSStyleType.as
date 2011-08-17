package org.osflash.css.types
{
	import org.osflash.css.errors.CSSError;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class CSSStyleType
	{
		
		public static const ID : CSSStyleType = new CSSStyleType('id', '#');
		
		public static const ELEMENT : CSSStyleType = new CSSStyleType('element', '');
		
		public static const CLASS : CSSStyleType = new CSSStyleType('class', '.');
		
		/**
		 * @private
		 */
		private var _name : String;
		
		/**
		 * @private
		 */
		private var _value : String;
		
		/**
		 * @private
		 */
		private var _type : String;

		public function CSSStyleType(type : String, value : String)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(type.length == 0) throw new ArgumentError('Type can not be empty');
			if(null == value) throw new ArgumentError('Value can not be null');
			
			_type = type;
			_value = value;
		}
		
		public static function typeAsString(type : CSSStyleType) : String
		{
			switch(type)
			{
				case ID: return type.type;
				case ELEMENT: return type.type;
				case CLASS: return type.type;
				default: 
					throw new CSSError('Unknown CSSStyleType'); 
			}
		}
		
		public static function typeAsValue(type : CSSStyleType) : String
		{
			switch(type)
			{
				case ID: return type.value;
				case ELEMENT: return type.value;
				case CLASS: return type.value;
				default: 
					throw new CSSError('Unknown CSSStyleType'); 
			}
		}
		
		public function get name() : String
		{
			if(null == _name) _name = typeAsString(this);
			return _name;
		}
		
		public function get value() : String { return _value; }
		
		public function get type() : String { return _type; }
	}
}
