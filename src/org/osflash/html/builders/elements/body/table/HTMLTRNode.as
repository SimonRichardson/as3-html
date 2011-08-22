package org.osflash.html.builders.elements.body.table
{
	import org.osflash.html.element.HTMLNodeContainer;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLTRNode extends HTMLNodeContainer
	{

		public function HTMLTRNode()
		{
			super(HTMLNodeType.TR);
			
			validNodeTypes.push(HTMLNodeType.TR, HTMLNodeType.TH);
		}
	}
}
