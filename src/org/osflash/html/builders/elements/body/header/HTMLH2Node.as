package org.osflash.html.builders.elements.body.header
{
	import org.osflash.html.builders.elements.common.HTMLTextNode;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLH2Node extends HTMLTextNode
	{

		public function HTMLH2Node(text : String)
		{
			super(HTMLNodeType.H2, text);
		}
	}
}
