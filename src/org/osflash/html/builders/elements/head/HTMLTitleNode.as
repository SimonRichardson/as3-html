package org.osflash.html.builders.elements.head
{
	import org.osflash.html.element.HTMLNodeRestricted;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class HTMLTitleNode extends HTMLNodeRestricted
	{
		
		/**
		 * @private
		 */
		private var _content : String;

		public function HTMLTitleNode(content : String = '')
		{
			super(HTMLNodeType.TITLE);
			
			_content = content;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const node : XML = super.write();
			node.appendChild(content);
			return node;
		}
		
		public function get content() : String { return _content; }
		public function set content(value : String) : void { _content = value; }
	}
}
