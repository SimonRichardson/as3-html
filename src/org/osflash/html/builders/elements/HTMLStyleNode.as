package org.osflash.html.builders.elements
{
	import org.osflash.css.CSSStyle;
	import org.osflash.html.builders.utils.HTMLMIMEType;
	import org.osflash.html.builders.utils.HTMLMediaType;
	import org.osflash.html.element.HTMLNodeRestrictedContainer;
	import org.osflash.html.element.HTMLNodeType;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class HTMLStyleNode extends HTMLNodeRestrictedContainer
	{
		
		/**
		 * @private
		 */
		private var _style : CSSStyle;
		
		/**
		 * @private
		 */
		private var _mimeType : HTMLMIMEType;
		
		/**
		 * @private
		 */
		private var _mediaType : HTMLMediaType;
		
		public function HTMLStyleNode(	style : CSSStyle, 
										type : HTMLMIMEType = null, 
										media : HTMLMediaType = null
										)
		{
			super(HTMLNodeType.STYLE);
			
			if(null == style) throw new ArgumentError('Style can not be null');
			
			_style = style;
			
			_mimeType = type || HTMLMIMEType.TEXT_CSS;
			_mediaType = media || HTMLMediaType.SCREEN;
		}

		/**
		 * @inheritDoc
		 */
		override public function write() : XML
		{
			const node : XML = super.write();
			
			node.@type = _mimeType.name;
			node.@media = _mediaType.name;
			
			const content : String = style.write();
			node.appendChild(content);
			
			return node;
		}
		
		public function get style() : CSSStyle { return _style; }
		
		public function get mimeType() : HTMLMIMEType { return _mimeType; }
		
		public function get mediaType() : HTMLMediaType { return _mediaType; } 
	}
}
