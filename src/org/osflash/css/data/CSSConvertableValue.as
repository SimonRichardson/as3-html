package org.osflash.css.data
{
	import org.osflash.stream.IStreamOutput;
	import org.osflash.stream.IStreamWriter;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class CSSConvertableValue implements IStreamWriter
	{
		
		private static const CHAR_PERCENT_SIGN : Number = "%".charCodeAt(0);

		private static const CHAR_P : Number = "p".charCodeAt(0);

		private static const CHAR_X : Number = "x".charCodeAt(0);
		
		/**
		 * @private
		 */
		private var _value : Object;

		/**
		 * @private
		 */
		private var _convertedValue : Number;

		/**
		 * @private
		 */
		private var _needsConversion : Boolean;

		/**
		 * @private
		 */
		private var _percent : Number;

		/**
		 * @private
		 */
		private var _hasConverter : Boolean;

		/**
		 * @private
		 */
		private var _converter : ICSSValueConverter;

		/**
		 * @private
		 */
		private var _isRelative : Boolean;
		
		public function CSSConvertableValue()
		{
			_value = null;
		}
		
		public function convert(value : Number) : Number
		{
			if (!_needsConversion) return _convertedValue;

			if (_hasConverter) _convertedValue = _converter.convert(value);
			else if (value < 0) _convertedValue = 0;
			else _convertedValue = value * _percent;
				
			return _convertedValue;
		}
		
		/**
		 * @inheritDoc
		 */
		public function write(stream : IStreamOutput) : void
		{
			if(null == value) stream.writeUTF('');
			else stream.writeUTF(value);
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
					_percent = NaN;
					_needsConversion = false;
					_converter = null;
					_hasConverter = false;
				}
				else if (CHAR_PERCENT_SIGN == str.charCodeAt((len - 1)))
				{
					_value = object;
					_convertedValue = NaN;
					_percent = parseFloat(str.substr(0, (len - 1))) / 100;
					_needsConversion = true;
					_converter = null;
					_hasConverter = false;
					_isRelative = true;
				}
				else if (CHAR_P == str.charCodeAt(len - 2) && CHAR_X == str.charCodeAt((len - 1)))
				{
					_value = object;
					_convertedValue = Number(str.substr(0, len - 2));
					_percent = NaN;
					_needsConversion = false;
					_converter = null;
					_hasConverter = false;
					_isRelative = false;
				}
				else throw new Error("Unknown string format \"" + str + "\".");
			}
			else if (object is int || object is uint || object is Number)
			{
				_value = object;
				_convertedValue = Number(_value);
				_percent = NaN;
				_needsConversion = false;
				_converter = null;
				_hasConverter = false;
				_isRelative = false;
			}
			else if (object is ICSSValueConverter)
			{
				_value = object;
				_convertedValue = NaN;
				_percent = NaN;
				_needsConversion = true;
				_converter = ICSSValueConverter(object);
				_hasConverter = true;
				_isRelative = true;
			}
			else if (object == null)
			{
				_value = null;
				_convertedValue = NaN;
				_percent = NaN;
				_needsConversion = false;
				_converter = null;
				_hasConverter = false;
			}
			else throw new ArgumentError("Value \"" + object + "\" is from unsupported type.");
		}

		public function get value() : * { return _value; }

		public function get relative() : Boolean
		{
			if (_isRelative)
			{
				if (_hasConverter) return _converter.relative;
				return true;
			}
			return false;
		}

		public function get convertedValue() : Number { return _convertedValue;	}
		
		public function get converter() : ICSSValueConverter { return _converter; }
		
		public function set converter(value : ICSSValueConverter) : void
		{
			if(null == value)
			{
				_converter = null;
				_hasConverter = false;
				return;
			}

			if (value == _converter) return;

			_converter = value;
			_hasConverter = true;
		}
	}
}
