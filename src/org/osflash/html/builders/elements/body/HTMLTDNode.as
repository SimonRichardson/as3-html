package org.osflash.html.builders.elements.body
{
	import org.osflash.html.element.HTMLNodeContainer;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLTDNode extends HTMLNodeContainer
	{
		
		/**
		 * @private
		 */
		private var _text : String;
		
		public function HTMLTDNode(text : String = '')
		{
			super(HTMLNodeType.TD);
			
			_text = text;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const node : XML = super.write();
			
			if (null != text && text.length > 0) node.appendChild(text);
			
			return node;
		}

		public function get text() : String { return _text; }
		public function set text(value : String) : void { _text = value; }
	}
}
