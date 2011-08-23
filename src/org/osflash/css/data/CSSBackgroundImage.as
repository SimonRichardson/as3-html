package org.osflash.css.data
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
		}
		
		public function get image() : String { return _image; }
		public function set image(value : String) : void { _image = value; }
		
		public function get imageType() : CSSBackgroundImageType { return _imageType; }
		public function set imageType(value : CSSBackgroundImageType) : void { _imageType = value; }
		
		public function get position() : String { return _position.value; }
		public function set position(value : String) : void { _position.value =  value; }
		
		public function get x() : * { return _position.x; }
		public function set x(value : *) : void { _position.x = value; }
		
		public function get y() : * { return _position.y; }
		public function set y(value : *) : void { _position.y = value; }
		
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