package org.osflash.html.builders.elements.body
{
	import org.osflash.html.element.HTMLNodeContainer;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLULNode extends HTMLNodeContainer
	{
		
		public function HTMLULNode()
		{
			super(HTMLNodeType.UL);
			
			validNodeTypes.push(HTMLNodeType.LI);
		}
	}
}
