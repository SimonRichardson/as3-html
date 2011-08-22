package org.osflash.html.builders.elements.body.header
{
	import org.osflash.html.builders.elements.common.HTMLTextNode;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLH4Node extends HTMLTextNode
	{

		public function HTMLH4Node(text : String)
		{
			super(HTMLNodeType.H4, text);
		}
	}
}
