package org.osflash.html.builders.elements
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
		private var _title : String;

		public function HTMLTitleNode(title : String = '')
		{
			super(HTMLNodeType.TITLE);
			
			_title = title;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const node : XML = super.write();
			node.appendChild(title);
			
			return node;
		}
		
		public function get title() : String { return _title; }
		public function set title(value : String) : void { _title = value; }
	}
}
