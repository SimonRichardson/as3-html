package org.osflash.html.builders.elements.script
{
	import org.osflash.html.builders.types.HTMLCharsetType;
	import org.osflash.html.builders.types.HTMLMIMEType;
	import org.osflash.html.element.HTMLNodeRestricted;
	import org.osflash.html.element.HTMLNodeType;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class HTMLScriptFileNode extends HTMLNodeRestricted
	{
		
		/**
		 * @private
		 */
		private var _mimeType : HTMLMIMEType;
		
		/**
		 * @private
		 */
		private var _src : String;
		
		/**
		 * @private
		 */
		private var _defer : Boolean;
		
		/**
		 * @private
		 */
		private var _charset : HTMLCharsetType;
		
		public function HTMLScriptFileNode(	src : String,
										mimeType : HTMLMIMEType = null,
										defer : Boolean = false,
										charset : HTMLCharsetType = null
										)
		{
			super(HTMLNodeType.SCRIPT);
			
			_src = src;
			_mimeType = mimeType || HTMLMIMEType.TEXT_JAVASCRIPT;
			_defer = defer;
			_charset = charset;
		}

		/**
		 * @inheritDoc
		 */
		override public function write() : XML
		{
			const node : XML = super.write();
			
			node.@type = mimeType.name;
			node.@src = src;
			
			if(defer) node.@defer = 'defer';
			if(null != charset) node.@charset = charset.name;
			
			// This is here because some browsers throw a hissy fit if there is not a closing tag
			// for script.
			node.appendChild('');
			
			return node;
		}

		public function get mimeType() : HTMLMIMEType { return _mimeType; }
		public function set mimeType(value : HTMLMIMEType) : void { _mimeType = value; }

		public function get src() : String { return _src; }
		public function set src(value : String) : void { _src = value; }

		public function get defer() : Boolean { return _defer; }
		public function set defer(value : Boolean) : void {	_defer = value; }

		public function get charset() : HTMLCharsetType { return _charset; }
		public function set charset(value : HTMLCharsetType) : void { _charset = value; }
	}
}
