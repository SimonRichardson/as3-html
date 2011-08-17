package org.osflash.html.builders.elements
{
	import org.osflash.html.element.HTMLNodeType;
	import org.osflash.html.element.HTMLNode;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLH1Node extends HTMLNode
	{

		/**
		 * @private
		 */
		private var _text : String;
		
		public function HTMLH1Node(text : String = '')
		{
			super(HTMLNodeType.H1);
			
			_text = text;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const node : XML = super.write();
			
			node.appendChild(text);
			
			return node;
		}
		
		public function get text() : String { return _text; }
		public function set text(value : String) : void { _text = value; }
		
	}
}
