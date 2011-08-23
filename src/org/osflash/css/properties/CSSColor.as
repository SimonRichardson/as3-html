package org.osflash.css.properties
{
	import org.osflash.css.utils.getDECtoHEX;
	import org.osflash.css.ICSSOutputWriter;
	import org.osflash.css.utils.convertToFloat;
	import org.osflash.css.utils.getHSLtoDEC;
	import org.osflash.css.utils.getRGBAtoDEC;
	import org.osflash.css.utils.getRGBtoDEC;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class CSSColor implements ICSSOutputWriter
	{
		
		private static const RGB_PATTERN : RegExp = /rgb?\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)/;
		
		private static const RGBA_PATTERN : RegExp = /rgba?\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+),\s*(\d+.\d+|.\d+|\d+)/;
		
		private static const HSL_PATTERN : RegExp = /hsl?\(\s*(\d+)\s*,\s*(\d+%|\d+.\d+|.\d+|\d+)\s*,\s*(\d+%|\d+.\d+|.\d+|\d+)/;
		
		private static const CHAR_HASH_SIGN : int = '#'.charCodeAt(0);
		
		private static const CHAR_R : int = 'r'.charCodeAt(0);
		
		private static const CHAR_G : int = 'g'.charCodeAt(0);
		
		private static const CHAR_B : int = 'b'.charCodeAt(0);
		
		private static const CHAR_H : int = 'h'.charCodeAt(0);
		
		private static const CHAR_S : int = 's'.charCodeAt(0);
		
		private static const CHAR_L : int = 'l'.charCodeAt(0);
		
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
		
		public function write() : String
		{
			if(null == value) return '';
			else return '#' + getDECtoHEX(convertedValue);
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
						_convertedValue = getRGBAtoDEC(	parseInt(rgba[1]), 
														parseInt(rgba[2]), 
														parseInt(rgba[3]),
														convertToFloat(rgba[4])
														);
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
						_convertedValue = getRGBtoDEC(	parseInt(rgb[1]), 
														parseInt(rgb[2]), 
														parseInt(rgb[3])
														);
					}
					else throw new ArgumentError("Value \"" + object + "\" is a unsupported type.");
				}
				else if (	CHAR_H == str.charCodeAt(0) &&
							CHAR_S == str.charCodeAt(1) && 
							CHAR_L == str.charCodeAt(2)
							)
				{
					_value = object;
					if(HSL_PATTERN.test(object))
					{
						const hsl : Object = HSL_PATTERN.exec(object);
						_convertedValue = getHSLtoDEC(	parseFloat(hsl[1]), 
														convertToFloat(hsl[2]), 
														convertToFloat(hsl[3])
														);
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
		}

		public function get value() : * { return _value; }
		
		public function get convertedValue() : uint { return _convertedValue; }
	}
}
