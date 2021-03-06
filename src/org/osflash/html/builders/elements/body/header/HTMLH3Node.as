package org.osflash.html.builders.elements.body.header
{
	import org.osflash.html.builders.elements.common.HTMLTextNode;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLH3Node extends HTMLTextNode
	{

		public function HTMLH3Node(text : String)
		{
			super(HTMLNodeType.H3, text);
		}
	}
}
