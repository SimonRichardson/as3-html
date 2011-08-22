package org.osflash.html.builders.elements.body
{
	import org.osflash.html.builders.elements.common.HTMLTextNode;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLQNode extends HTMLTextNode
	{
				
		public function HTMLQNode(text : String)
		{
			super(HTMLNodeType.Q, text);
		}
	}
}
