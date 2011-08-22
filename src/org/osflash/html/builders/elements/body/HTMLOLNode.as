package org.osflash.html.builders.elements.body
{
	import org.osflash.html.element.HTMLNodeContainer;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLOLNode extends HTMLNodeContainer
	{
		
		public function HTMLOLNode()
		{
			super(HTMLNodeType.OL);
			
			validNodeTypes.push(HTMLNodeType.LI);
		}
	}
}
