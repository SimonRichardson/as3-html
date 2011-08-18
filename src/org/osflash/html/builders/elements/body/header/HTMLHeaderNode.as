package org.osflash.html.builders.elements.body.header
{
	import org.osflash.html.element.HTMLNodeType;
	import org.osflash.html.element.HTMLNodeRestricted;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLHeaderNode extends HTMLNodeRestricted
	{
		
		/**
		 * @private
		 */
		private var _text : String;

		public function HTMLHeaderNode(type : HTMLNodeType, text : String = '')
		{
			super(type);
			
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
