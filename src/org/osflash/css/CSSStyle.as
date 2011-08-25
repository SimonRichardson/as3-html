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
	import org.osflash.css.types.CSSOverflowType;
	import org.osflash.css.types.CSSPositionType;
	import org.osflash.css.types.CSSStyleType;
	import org.osflash.css.types.CSSVisibilityType;
	import org.osflash.css.utils.getDECtoHEX;
	import org.osflash.stream.IStreamOutput;
	import org.osflash.stream.IStreamWriter;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class CSSStyle implements IStreamWriter
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
		private var _background : CSSBackground;
		
		/**
		 * @private
		 */
		private var _bounds : CSSRectangle;
		
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
		private var _color : CSSColor;
		
		/**
		 * @private
		 */
		private var _display : CSSDisplayType;
		
		/**
		 * @private
		 */
		private var _direction : CSSDirectionType;
		
		/**
		 * @private
		 */
		private var _margin : CSSMargin;
		
		/**
		 * @private
		 */
		private var _overflow : CSSOverflowType;
		
		/**
		 * @private
		 */
		private var _padding : CSSPadding;
		
		/**
		 * @private
		 */
		private var _position : CSSPositionType;
		
		/**
		 * @private
		 */
		private var _visibility : CSSVisibilityType;
				
		public function CSSStyle(type : CSSStyleType, name : String)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(null == name) throw new ArgumentError('Name can not be null');
			if(name.length == 0) throw new ArgumentError('Name can not be empty');
			
			_type = type;
			_name = name;
			
			_background = new CSSBackground();
			_bounds = new CSSRectangle();
			_clip = new CSSRectangle();
			_color = new CSSColor();
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
		
		public function write(stream : IStreamOutput) : void
		{
			if(type != CSSStyleType.INLINE) stream.writeUTF(type.value + name + '{');
						
			if(padding.hasValidProperties()) 
			{
				padding.write(stream);
				stream.writeUTF(' ');
			}
			
			if(margin.hasValidProperties()) 
			{
				margin.write(stream);
				stream.writeUTF(' ');
			}
			
			if(background.hasValidProperties()) 
			{
				background.write(stream);
				stream.writeUTF(' ');
			}
			
			if(null != color) stream.writeUTF('color: ' + getDECtoHEX(_color.convertedValue) + '; ');
			if(clip.hasValidProperties()) stream.writeUTF('clip: ' + clip.write(stream) + '; ');
			
			if(null != top) stream.writeUTF('top: ' + top + '; ');
			if(null != left) stream.writeUTF('left: ' + left + '; ');
			if(null != width) stream.writeUTF('width: ' + width + '; ');
			if(null != height) stream.writeUTF('height: ' + height + '; ');
			
			if(null != clear) stream.writeUTF('clear: ' + clear.name + '; ');
			if(null != direction) stream.writeUTF('direction: ' + direction.name + '; ');
			if(null != display) stream.writeUTF('display: ' + display.name + '; ');
			if(null != overflow) stream.writeUTF('overflow: ' + overflow.name + '; ');
			if(null != position) stream.writeUTF('position: ' + position.name + '; ');
			if(null != visibility) stream.writeUTF('visibility: ' + visibility.name + '; ');
			
			if(type != CSSStyleType.INLINE) stream.writeUTF('}');
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
		
		public function get clear() : CSSClearType { return _clear; }
		public function set clear(value : CSSClearType) : void { _clear = value; }
		
		public function get color() : * { return _color.value; }
		public function set color(value : *) : void { _color.value = value; }
		
		public function get direction() : CSSDirectionType { return _direction; }
		public function set direction(value : CSSDirectionType) : void { _direction = value; }
		
		public function get display() : CSSDisplayType { return _display; }
		public function set display(value : CSSDisplayType) : void { _display = value; }
		
		public function get overflow() : CSSOverflowType { return _overflow; }
		public function set overflow(value : CSSOverflowType) : void { _overflow = value; }
		
		public function get position() : CSSPositionType { return _position; }
		public function set position(value : CSSPositionType) : void { _position = value; }
		
		public function get visibility() : CSSVisibilityType { return _visibility; }
		public function set visibility(value : CSSVisibilityType) : void { _visibility = value; }
		
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
