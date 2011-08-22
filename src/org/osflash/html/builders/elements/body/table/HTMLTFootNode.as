package org.osflash.html.builders.elements.body.table
{
	import org.osflash.html.element.HTMLNodeContainer;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLTFootNode extends HTMLNodeContainer
	{

		public function HTMLTFootNode()
		{
			super(HTMLNodeType.TFOOT);
			
			validNodeTypes.push(HTMLNodeType.TR);
		}
	}
}
