package org.osflash.html.builders.elements.body
{
	import org.osflash.html.builders.types.HTMLRevisionType;
	import org.osflash.html.element.HTMLNodeContainer;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLHeaderNode extends HTMLNodeContainer
	{

		public function HTMLHeaderNode()
		{
			super(HTMLNodeType.HEADER);
			
			revision = HTMLRevisionType.HTML_5;
		}
	}
}
