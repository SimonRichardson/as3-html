package org.osflash.css
{
	import org.osflash.css.geom.CSSTRBL;
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
		private var _bounds : CSSTRBL;
		
		/**
		 * @private
		 */
		private var _margin : CSSMargin;
		
		/**
		 * @private
		 */
		private var _padding : CSSPadding;
		
		/**
		 * @private
		 */
		private var _backgroundColor : int;
		
		public function CSSStyle(type : CSSStyleType, name : String)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(null == name) throw new ArgumentError('Name can not be null');
			if(name.length == 0) throw new ArgumentError('Name can not be empty');
			
			_type = type;
			_name = name;
			
			_bounds = new CSSTRBL();
			_margin = new CSSMargin();
			_padding = new CSSPadding();
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
			
			if(padding.hasValidProperties()) buffer.push(padding.write());
			if(margin.hasValidProperties()) buffer.push(margin.write());
			
			if(null != top) buffer.push('top:', top, ';');
			if(null != left) buffer.push('left:', left, ';');
			if(null != width) buffer.push('width:', width, ';');
			if(null != height) buffer.push('height:', height, ';');
			
			if(backgroundColor >= 0) buffer.push('background-color:', '#ff0000', ';');
			
			buffer.push('}');
			
			return buffer.join(' ');
		}
		
		public function hasValidProperties() : Boolean
		{
			return padding.hasValidProperties() || margin.hasValidProperties();
		}
		
		public function get type() : CSSStyleType { return _type; }
		
		public function get margin() : CSSMargin { return _margin; }
		
		public function get padding() : CSSPadding { return _padding; }
		
		public function get name() : String { return _name; }
		public function set name(value : String) : void
		{
			if(null == name) throw new ArgumentError('Name can not be null');
			if(name.length == 0) throw new ArgumentError('Name can not be empty');
			
			_name = value;
		}
		
		public function get backgroundColor() : int { return _backgroundColor; }
		public function set backgroundColor(value : int) : void { _backgroundColor = value; }
		
		public function get top() : * { return _bounds.top; }
		public function set top(value : *) : void { _bounds.top = value; }
		
		public function get left() : * { return _bounds.left; }
		public function set left(value : *) : void { _bounds.left = value; }
		
		public function get width() : * { return _bounds.right; }
		public function set width(value : *) : void { _bounds.right = value; }
		
		public function get height() : * { return _bounds.bottom; }
		public function set height(value : *) : void { _bounds.bottom = value; }
	}
}
