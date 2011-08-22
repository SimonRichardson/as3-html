package org.osflash.html.builders.elements.body
{
	import org.osflash.html.element.HTMLNodeType;
	import org.osflash.html.builders.elements.common.HTMLTextNode;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLCaptionNode extends HTMLTextNode
	{

		public function HTMLCaptionNode(text : String)
		{
			super(HTMLNodeType.CAPTION, text);
		}
	}
}
