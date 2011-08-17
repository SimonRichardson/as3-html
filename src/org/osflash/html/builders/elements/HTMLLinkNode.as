package org.osflash.html.builders.elements
{
	import org.osflash.html.element.HTMLNodeType;
	import org.osflash.html.builders.types.HTMLMIMEType;
	import org.osflash.html.builders.types.HTMLRelType;
	import org.osflash.html.element.HTMLNodeRestricted;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLLinkNode extends HTMLNodeRestricted
	{

		/**
		 * @private
		 */
		private var _href : String;
		
		/**
		 * @private
		 */
		private var _mimeType : HTMLMIMEType;
		
		/**
		 * @private
		 */
		private var _relType : HTMLRelType;

		public function HTMLLinkNode(	href : String = '', 
										type : HTMLMIMEType = null, 
										rel : HTMLRelType = null
										)
		{
			super(HTMLNodeType.LINK);
			
			_href = href;
			_mimeType = type || HTMLMIMEType.TEXT_CSS;
			_relType = rel || HTMLRelType.STYLESHEET;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const node : XML = super.write();
			
			node.@href = href;
			node.@type = mimeType.name;
			node.@rel = relType.name;
			
			return node;
		}
		
		public function get href() : String { return _href; }
		public function set href(value : String) : void { _href = value; }
		
		public function get mimeType() : HTMLMIMEType { return _mimeType; }
		public function set mimeType(value : HTMLMIMEType) : void { _mimeType = value; }
		
		public function get relType() : HTMLRelType { return _relType; }
		public function set relType(value : HTMLRelType) : void { _relType = value; }
	}
}
