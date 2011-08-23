package org.osflash.css
{
	import org.osflash.css.geom.CSSMargin;
	import org.osflash.css.geom.CSSPadding;
	import org.osflash.css.geom.CSSRectangle;
	import org.osflash.css.properties.CSSBackground;
	import org.osflash.css.properties.CSSColor;
	import org.osflash.css.types.CSSClearType;
	import org.osflash.css.types.CSSDirectionType;
	import org.osflash.css.types.CSSDisplayType;
	import org.osflash.css.types.CSSStyleType;
	import org.osflash.css.utils.getDECtoHEX;
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
		private var _bounds : CSSRectangle;
		
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
		private var _color : CSSColor;
		
		/**
		 * @private
		 */
		private var _background : CSSBackground;
		
		/**
		 * @private
		 */
		private var _clip : CSSRectangle;
		
		/**
		 * @private
		 */
		private var _clear : CSSClearType;
		
		/**
		 * @private
		 */
		private var _display : CSSDisplayType;
		
		/**
		 * @private
		 */
		private var _direction : CSSDirectionType;
				
		public function CSSStyle(type : CSSStyleType, name : String)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(null == name) throw new ArgumentError('Name can not be null');
			if(name.length == 0) throw new ArgumentError('Name can not be empty');
			
			_type = type;
			_name = name;
			
			_clip = new CSSRectangle();
			_bounds = new CSSRectangle();
			_margin = new CSSMargin();
			_padding = new CSSPadding();
			
			_color = new CSSColor();
			_background = new CSSBackground();
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
		
		public function setBackground(...rest) : CSSStyle
		{
			background.setValues.apply(null, rest);
			return this;
		}
		
		public function setClip(...rest) : CSSStyle
		{
			clip.setValues.apply(null, rest);
			return this;
		}
		
		public function write() : String
		{
			const buffer : Vector.<String> = new Vector.<String>();
			
			if(type != CSSStyleType.INLINE) buffer.push(type.value + name, '{');
			
			if(null != color) buffer.push('color:', getDECtoHEX(_color.convertedValue), ';');
			if(padding.hasValidProperties()) buffer.push(padding.write());
			if(margin.hasValidProperties()) buffer.push(margin.write());
			if(background.hasValidProperties()) buffer.push(background.write());
			
			if(clip.hasValidProperties()) buffer.push('clip: ', clip.write(), ';');
			
			if(null != top) buffer.push('top:', top, ';');
			if(null != left) buffer.push('left:', left, ';');
			if(null != width) buffer.push('width:', width, ';');
			if(null != height) buffer.push('height:', height, ';');
			
			if(null != display) buffer.push('display: ', display.name, ';');
			if(null != clear) buffer.push('clear: ', clear.name, ';');
			if(null != direction) buffer.push('direction: ', direction.name, ';');
			
			if(type != CSSStyleType.INLINE) buffer.push('}');
			
			return buffer.join(' ');
		}
		
		public function hasValidProperties() : Boolean
		{
			// TODO : work out how to know if there is any valid properties!
			return true;
		}
		
		public function get type() : CSSStyleType { return _type; }
		
		public function get margin() : CSSMargin { return _margin; }
		
		public function get padding() : CSSPadding { return _padding; }
		
		public function get background() : CSSBackground { return _background; }
		
		public function get clip() : CSSRectangle { return _clip; }
		
		public function get name() : String { return _name; }
		public function set name(value : String) : void
		{
			if(null == name) throw new ArgumentError('Name can not be null');
			if(name.length == 0) throw new ArgumentError('Name can not be empty');
			
			_name = value;
		}
		
		public function get color() : * { return _color.value; }
		public function set color(value : *) : void { _color.value = value; }
		
		public function get top() : * { return _bounds.top; }
		public function set top(value : *) : void { _bounds.top = value; }
		
		public function get left() : * { return _bounds.left; }
		public function set left(value : *) : void { _bounds.left = value; }
		
		public function get width() : * { return _bounds.right; }
		public function set width(value : *) : void { _bounds.right = value; }
		
		public function get height() : * { return _bounds.bottom; }
		public function set height(value : *) : void { _bounds.bottom = value; }
		
		public function get clear() : CSSClearType { return _clear; }
		public function set clear(value : CSSClearType) : void { _clear = value; }
		
		public function get display() : CSSDisplayType { return _display; }
		public function set display(value : CSSDisplayType) : void { _display = value; }
		
		public function get direction() : CSSDirectionType { return _direction; }
		public function set direction(value : CSSDirectionType) : void { _direction = value; }
	}
}
