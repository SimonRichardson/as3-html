package org.osflash.html.builders.elements.body
{
	import org.osflash.html.builders.elements.common.HTMLTextNode;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLSUBNode extends HTMLTextNode
	{

		public function HTMLSUBNode(text : String)
		{
			super(HTMLNodeType.SUB, text);
		}
	}
}
