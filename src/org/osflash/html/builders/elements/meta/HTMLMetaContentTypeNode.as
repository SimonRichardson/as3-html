package org.osflash.html.builders.elements.meta
{
	import org.osflash.html.builders.types.HTMLEquivType;
	import org.osflash.html.builders.types.meta.HTMLMetaContentType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLMetaContentTypeNode extends HTMLMetaEquivTypeNode
	{

		
		/**
		 * @private
		 */
		private var _content : HTMLMetaContentType;

		public function HTMLMetaContentTypeNode(content : HTMLMetaContentType)
		{
			super(HTMLEquivType.CONTENT_TYPE);
			
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

		public function get content() : HTMLMetaContentType { return _content; }
		public function set content(value : HTMLMetaContentType) : void { _content = value; }

	}
}
