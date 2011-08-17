package org.osflash.html.builders.elements
{
	import org.osflash.html.element.HTMLNode;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLH2Node extends HTMLNode
	{

		/**
		 * @private
		 */
		private var _text : String;
		
		public function HTMLH2Node(text : String = '')
		{
			super(HTMLNodeType.H2);
			
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