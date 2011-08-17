package org.osflash.html.builders.elements.meta
{
	import org.osflash.html.builders.types.HTMLEquivType;
	import org.osflash.html.builders.types.meta.HTMLMetaCacheContentType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLMetaCacheContentNode extends HTMLMetaEquivTypeNode
	{
		
		/**
		 * @private
		 */
		private var _content : HTMLMetaCacheContentType;

		public function HTMLMetaCacheContentNode(content : HTMLMetaCacheContentType)
		{
			super(HTMLEquivType.CACHE_CONTROL);
			
			_content = content;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const node : XML = super.write();
			
			node.@content = content.name;
			
			return node;
		}

		public function get content() : HTMLMetaCacheContentType { return _content; }
		public function set content(value : HTMLMetaCacheContentType) : void { _content = value; }
	}
}
