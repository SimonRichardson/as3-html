package org.osflash.html.builders.types
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLVAlignType
	{

		public static const TOP : HTMLVAlignType = new HTMLVAlignType('top');

		public static const MIDDLE : HTMLVAlignType = new HTMLVAlignType('middle');

		public static const BOTTOM : HTMLVAlignType = new HTMLVAlignType('bottom');

		public static const BASELINE : HTMLVAlignType = new HTMLVAlignType('baseline');

		/**
		 * @private
		 */
		private var _type : String;

		/**
		 * @private
		 */
		private var _name : String;

		public function HTMLVAlignType(type : String)
		{
			if (null == type) throw new ArgumentError('Type can not be null');
			if (type.length == 0) throw new ArgumentError('Type can not be empty');

			_type = type;
		}

		public static function typeAsString(type : HTMLVAlignType) : String
		{
			switch(type)
			{
				case TOP:
				case MIDDLE:
				case BOTTOM:
				case BASELINE:
					return type.type;
				default:
					throw new ArgumentError('Unknown HTMLVAlignType found');
			}
		}

		public function get name() : String
		{
			if (null == _name) _name = typeAsString(this);
			return _name;
		}

		public function get type() : String
		{
			return _type;
		}
	}
}
