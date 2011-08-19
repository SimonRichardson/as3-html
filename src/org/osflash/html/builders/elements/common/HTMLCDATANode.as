package org.osflash.html.builders.elements.common
{
	import org.osflash.html.element.HTMLNode;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLCDATANode extends HTMLNode implements IHTMLRawTextNode
	{
		
		/**
		 * @private
		 */
		private var _text : String;

		public function HTMLCDATANode(text : String)
		{
			super(HTMLNodeType.CDATA);
			
			_text = text;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function write() : XML
		{
			return new XML('<![CDATA[' + text + ']]>');
		}

		public function get text() : String { return _text; }
		public function set text(value : String) : void { _text = value; }
	}
}
