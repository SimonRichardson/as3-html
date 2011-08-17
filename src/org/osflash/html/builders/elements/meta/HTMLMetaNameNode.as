package org.osflash.html.builders.elements.meta
{
	import org.osflash.html.element.HTMLNodeRestricted;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLMetaNameNode extends HTMLNodeRestricted
	{

		/**
		 * @private
		 */
		private var _name : String;
		
		/**
		 * @private
		 */
		private var _content : String;

		public function HTMLMetaNameNode(name : String, content : String)
		{
			super(HTMLNodeType.META);
			
			_name = name;
			_content = content;
		}
				
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const node : XML = super.write();
			
			node.@name = key;
			node.@content = content;
			
			return node;
		}

		public function get key() : String { return _name; }
		public function set key(value : String) : void { _name = value; }

		public function get content() : String { return _content; }
		public function set content(value : String) : void { _content = value; }
		
	}
}
