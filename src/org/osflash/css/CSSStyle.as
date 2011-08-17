package org.osflash.css
{
	import org.osflash.css.types.CSSStyleType;
	import org.osflash.css.geom.CSSMargin;
	import org.osflash.css.geom.CSSPadding;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class CSSStyle
	{
		
		/**
		 * @private
		 */
		private var _type : CSSStyleType;
		
		/**
		 * @private
		 */
		private var _name : String;
		
		/**
		 * @private
		 */
		private var _margin : CSSMargin;
		
		/**
		 * @private
		 */
		private var _padding : CSSPadding;
		
		public function CSSStyle(type : CSSStyleType, name : String)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(null == name) throw new ArgumentError('Name can not be null');
			if(name.length == 0) throw new ArgumentError('Name can not be empty');
			
			_type = type;
			_name = name;
		}
		
		public function setPadding(...rest) : CSSStyle
		{
			padding.setValues.apply(null, rest);
			return this;
		}
		
		public function setMargin(...rest) : CSSStyle
		{
			margin.setValues.apply(null, rest);
			return this;
		}
		
		public function write() : String
		{
			const buffer : Vector.<String> = new Vector.<String>();
			buffer.push(type.value + name, '{');
			
			if(null != _padding) buffer.push(padding.write());
			if(null != _margin) buffer.push(margin.write());
			
			buffer.push('}');
			
			return buffer.join(' ');
		}
		
		public function get type() : CSSStyleType { return _type; }
		
		public function get margin() : CSSMargin 
		{ 
			if(null == _margin) _margin = new CSSMargin();
			return _margin; 
		}
		
		public function get padding() : CSSPadding 
		{ 
			if(null == _padding) _padding = new CSSPadding();
			return _padding; 
		}
		
		public function get name() : String { return _name; }
	}
}
