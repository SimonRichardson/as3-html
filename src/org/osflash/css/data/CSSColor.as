package org.osflash.css.data
{
	import org.osflash.logger.logs.info;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class CSSColor
	{
		
		private static const RGB_PATTERN : RegExp = /rgb?\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)/;
		
		private static const RGBA_PATTERN : RegExp = /rgba?\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+),\s*(\d+.\d+|.\d+|\d+)/;
		
		private static const CHAR_HASH_SIGN : int = '#'.charCodeAt(0);
		
		private static const CHAR_R : int = 'r'.charCodeAt(0);
		
		private static const CHAR_G : int = 'g'.charCodeAt(0);
		
		private static const CHAR_B : int = 'b'.charCodeAt(0);
		
		private static const CHAR_A : int = 'a'.charCodeAt(0);
		
		/**
		 * @private
		 */
		private var _value : Object;
		
		/**
		 * @private
		 */
		private var _convertedValue : uint;

		public function CSSColor()
		{
			_value = null;
		}
		
		public function set value(object : *) : void
		{
			var str : String = null;
			var len : Number = NaN;
			if (object is String)
			{
				str = String(object).toLowerCase();
				len = str.length;
				if (len == 0)
				{
					_value = null;
					_convertedValue = NaN;
				}
				else if (CHAR_HASH_SIGN == str.charCodeAt(0))
				{
					_value = object;
					_convertedValue = parseInt(str.substr(1), 16);
				}
				else if (	CHAR_R == str.charCodeAt(0) &&
							CHAR_G == str.charCodeAt(1) && 
							CHAR_B == str.charCodeAt(2) &&
							CHAR_A == str.charCodeAt(3)
							)
				{
					_value = object;
					if(RGBA_PATTERN.test(object))
					{
						const rgba : Object = RGBA_PATTERN.exec(object);
						const r0 : int = parseInt(rgba[1]);
						const g0 : int = parseInt(rgba[2]);
						const b0 : int = parseInt(rgba[3]);
						const a0 : int = parseFloat(rgba[4]);
						_convertedValue = ((a0 * 255) << 24) | (r0 << 16) | (g0 << 8) | b0;
					}
					else throw new ArgumentError("Value \"" + object + "\" is a unsupported type.");
				}
				else if (	CHAR_R == str.charCodeAt(0) &&
							CHAR_G == str.charCodeAt(1) && 
							CHAR_B == str.charCodeAt(2)
							)
				{
					_value = object;
					
					if(RGB_PATTERN.test(object))
					{
						const rgb : Object = RGB_PATTERN.exec(object);
						const r1 : int = parseInt(rgb[1]);
						const g1 : int = parseInt(rgb[2]);
						const b1 : int = parseInt(rgb[3]);
						_convertedValue = (r1 << 16) | (g1 << 8) | b1;
					}
					else throw new ArgumentError("Value \"" + object + "\" is a unsupported type.");
				}
				else throw new Error("Unknown string format \"" + str + "\".");
			}
			else if (object is int || object is uint || object is Number)
			{
				_value = object;
				_convertedValue = int(_value);
			}
			else if (object == null)
			{
				_value = null;
				_convertedValue = NaN;
			}
			else throw new ArgumentError("Value \"" + object + "\" is from unsupported type.");
			
			info(_convertedValue);
		}

		public function get value() : * { return _value; }
		
		public function get convertedValue() : int { return _convertedValue;	}
	}
}
