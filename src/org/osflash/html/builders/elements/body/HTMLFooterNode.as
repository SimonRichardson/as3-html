package org.osflash.html.builders.elements.body
{
	import org.osflash.html.builders.types.HTMLRevisionType;
	import org.osflash.html.element.HTMLNodeContainer;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLFooterNode extends HTMLNodeContainer
	{

		public function HTMLFooterNode()
		{
			super(HTMLNodeType.FOOTER);
			
			revision = HTMLRevisionType.HTML_5;
		}
	}
}
