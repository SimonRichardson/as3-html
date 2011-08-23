package org.osflash.css.types
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class CSSBackgroundAttachmentType
	{
		
		public static const SCROLL : CSSBackgroundAttachmentType = 
														new CSSBackgroundAttachmentType('scroll');
		
		public static const FIXED : CSSBackgroundAttachmentType = 
														new CSSBackgroundAttachmentType('fixed');
														
		public static const INHERIT : CSSBackgroundAttachmentType = 
														new CSSBackgroundAttachmentType('inherit');
		
		/**
		 * @private
		 */
		private var _type : String;

		/**
		 * @private
		 */
		private var _name : String;

		public function CSSBackgroundAttachmentType(type : String)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(type.length == 0) throw new ArgumentError('Type can not be empty');
			
			_type = type;
		}
		
		public static function typeAsString(type : CSSBackgroundAttachmentType) : String
		{
			switch(type)
			{
				case SCROLL:
				case FIXED:
				case INHERIT:
					return type.type;
				default: 
					throw new ArgumentError('Unknown CSSBackgroundAttachmentType found');
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
