package org.osflash.html.builders.elements.body
{
	import org.osflash.html.element.HTMLNodeContainer;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLOptGroupNode extends HTMLNodeContainer
	{
		
		public function HTMLOptGroupNode()
		{
			super(HTMLNodeType.OPT_GROUP);
			
			validNodeTypes.push(HTMLNodeType.OPTION);
		}
	}
}
