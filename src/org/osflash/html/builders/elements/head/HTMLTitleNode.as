package org.osflash.html.builders.elements.head
{
	import org.osflash.html.builders.elements.common.HTMLTextNode;
	import org.osflash.html.element.HTMLNodeType;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class HTMLTitleNode extends HTMLTextNode
	{

		public function HTMLTitleNode(text : String = '')
		{
			super(HTMLNodeType.TITLE, text);
		}
	}
}
