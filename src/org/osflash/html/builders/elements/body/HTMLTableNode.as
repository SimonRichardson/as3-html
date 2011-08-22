package org.osflash.html.builders.elements.body
{
	import org.osflash.html.element.HTMLNodeType;
	import org.osflash.html.element.HTMLNodeContainer;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLTableNode extends HTMLNodeContainer
	{

		public function HTMLTableNode()
		{
			super(HTMLNodeType.TABLE);
			
			validNodeTypes.push(	
									HTMLNodeType.COL,
									HTMLNodeType.COL_GROUP,
									HTMLNodeType.TBODY,
									HTMLNodeType.TFOOT,
									HTMLNodeType.THEAD,
									HTMLNodeType.TR
									);
		}
	}
}
