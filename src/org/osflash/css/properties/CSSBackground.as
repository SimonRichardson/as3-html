package org.osflash.css.properties
{
	import org.osflash.css.css_namespace;
	import org.osflash.css.errors.CSSError;
	import org.osflash.css.utils.getDECtoHEX;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class CSSBackground
	{

		use namespace css_namespace;
		
		/**
		 * @private
		 */
		private var _color : CSSColor;
		
		/**
		 * @private
		 */
		private var _images : Vector.<CSSBackgroundImage>;
		
		public function CSSBackground()
		{
			_color = new CSSColor();
			_images = new Vector.<CSSBackgroundImage>();
		}
		
		public function add(image : CSSBackgroundImage) : CSSBackground
		{
			if(_images.indexOf(image) == -1) _images.push(image);
			else throw new CSSError('Image already exists');
			
			image.parent = this;
			
			return this;
		}
		
		public function remove(image : CSSBackgroundImage) : CSSBackground
		{
			const index : int = _images.indexOf(image);
			if(index >= 0) _images.splice(index, 1);
			else throw new CSSError('Image does not exists');
			
			image.parent = null;
			
			return this;
		}
		
		public function contains(image : CSSBackgroundImage) : Boolean
		{
			return _images.indexOf(image) >= 0;
		}
		
		public function getIndex(image : CSSBackgroundImage) : int
		{
			return _images.indexOf(image);
		}
		
		public function getAt(index : int) : CSSBackgroundImage
		{
			if(index < 0 || index >= _images.length) throw new RangeError();
			else return _images[index];
		}
		
		public function setValues(...rest) : void
		{
			
		}
		
		public function write() : String
		{
			const buffer : Vector.<String> = new Vector.<String>();
			
			if(length == 0 && null != color) 
			{
				buffer.push('background-color:', getDECtoHEX(_color.convertedValue), ';');
			}
			else
			{
				buffer.push('background:');
				if(null != color) buffer.push(getDECtoHEX(_color.convertedValue));
				
				const total : int = length;
				for(var i : int = 0; i < total; i++)
				{
					const image : CSSBackgroundImage = _images[i];
					if(image.hasValidProperties()) buffer.push(image.write());
					buffer.push(',');
				}
				
				if(buffer[buffer.length - 1] == ',') buffer.pop();
				buffer.push(';');
			}
			
			return buffer.join(' ');
		}
		
		public function hasValidProperties() : Boolean
		{
			return length > 0 || null != color;
		}
		
		public function get color() : * { return _color.value; }
		public function set color(value : *) : void { _color.value = value; }
		
		public function get length() : int { return _images.length; }
	}
}
