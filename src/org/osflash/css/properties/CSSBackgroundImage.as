package org.osflash.css.properties
{
	import org.osflash.css.css_namespace;
	import org.osflash.css.geom.CSSPoint;
	import org.osflash.css.types.CSSBackgroundAttachmentType;
	import org.osflash.css.types.CSSBackgroundImageType;
	import org.osflash.css.types.CSSBackgroundRepeatType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class CSSBackgroundImage
	{

		use namespace css_namespace;
		
		/**
		 * @private
		 */
		private var _size : CSSPoint;
		
		/**
		 * @private
		 */
		private var _position : CSSPoint;
		
		/**
		 * @inheritDoc
		 */
		private var _image : String;
		
		/**
		 * @private
		 */
		private var _imageType : CSSBackgroundImageType;
		
		/**
		 * @private
		 */
		private var _repeat : CSSBackgroundRepeatType;
		
		/**
		 * @private
		 */
		private var _attachment : CSSBackgroundAttachmentType;
		
		/**
		 * @private
		 */
		private var _parent : CSSBackground;

		public function CSSBackgroundImage()
		{
			_imageType = CSSBackgroundImageType.NONE;
			
			_parent = null;
			
			_size = new CSSPoint();
			_position = new CSSPoint();
		}
		
		public function write() : String
		{
			if(imageType == CSSBackgroundImageType.NONE) return '';
			else if(imageType == CSSBackgroundImageType.INHERIT) return imageType.name;
			else
			{
				const buffer : Vector.<String> = new Vector.<String>();
				if(null == parent) buffer.push('background-image:');
				
				if(image.indexOf('URL') == -1) buffer.push('URL(' + image + ')');
				else buffer.push(image);
				
				if(_position.hasValidProperties()) buffer.push(_position.write());
				if(_size.hasValidProperties()) buffer.push(_size.write());
				if(null != _repeat) buffer.push(_repeat.name);
				if(null != _attachment) buffer.push(_attachment.name);
				
				if(null == parent) buffer.push(';');
				return buffer.join(' ');
			}
		}
		
		public function hasValidProperties() : Boolean
		{
			return imageType != CSSBackgroundImageType.NONE && null != image;
		}
		
		public function get image() : String { return _image; }
		public function set image(value : String) : void { _image = value; }
		
		public function get imageType() : CSSBackgroundImageType { return _imageType; }
		public function set imageType(value : CSSBackgroundImageType) : void { _imageType = value; }
		
		public function get size() : String { return _size.value; }
		public function set size(value : String) : void { _size.value =  value; }
		
		public function get position() : String { return _position.value; }
		public function set position(value : String) : void { _position.value =  value; }
		
		public function get x() : * { return _position.x; }
		public function set x(value : *) : void { _position.x = value; }
		
		public function get y() : * { return _position.y; }
		public function set y(value : *) : void { _position.y = value; }
		
		public function get width() : * { return _size.x; }
		public function set width(value : *) : void { _size.x = value; }
		
		public function get height() : * { return _size.y; }
		public function set height(value : *) : void { _size.y = value; }
		
		public function get repeat() : CSSBackgroundRepeatType { return _repeat; }
		public function set repeat(value : CSSBackgroundRepeatType) : void { _repeat = value; }
		
		public function get attachment() : CSSBackgroundAttachmentType { return _attachment; }
		public function set attachment(value : CSSBackgroundAttachmentType) : void 
		{ 
			_attachment = value;
		}
		
		css_namespace function get parent() : CSSBackground { return _parent; }
		css_namespace function set parent(value : CSSBackground) : void { _parent = value; }
	}
}
