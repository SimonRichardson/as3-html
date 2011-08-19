package org.osflash.html.builders.elements.common
{
	import org.osflash.html.element.HTMLNodeType;
	import org.osflash.html.element.HTMLNode;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLRawTextNode extends HTMLNode implements IHTMLRawTextNode
	{
		
		/**
		 * @private
		 */
		private var _text : String;

		public function HTMLRawTextNode(text : String)
		{
			super(HTMLNodeType.RAW_TEXT);
			
			_text = text;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function write() : XML
		{
			return new XML(text);
		}

		public function get text() : String { return _text; }
		public function set text(value : String) : void { _text = value; }
	}
}
