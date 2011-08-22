package org.osflash.html.builders.elements.body.table
{
	import org.osflash.html.element.HTMLNodeContainer;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLTBodyNode extends HTMLNodeContainer
	{

		public function HTMLTBodyNode()
		{
			super(HTMLNodeType.TBODY);
			
			validNodeTypes.push(HTMLNodeType.TR);
		}
	}
}
