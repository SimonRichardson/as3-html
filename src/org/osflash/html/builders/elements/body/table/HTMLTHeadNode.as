package org.osflash.html.builders.elements.body.table
{
	import org.osflash.html.element.HTMLNodeContainer;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLTHeadNode extends HTMLNodeContainer
	{

		public function HTMLTHeadNode()
		{
			super(HTMLNodeType.THEAD);
			
			validNodeTypes.push(HTMLNodeType.TR);
		}
	}
}
