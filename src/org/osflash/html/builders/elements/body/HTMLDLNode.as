package org.osflash.html.builders.elements.body
{
	import org.osflash.html.element.HTMLNodeContainer;
	import org.osflash.html.element.HTMLNodeType;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLDLNode extends HTMLNodeContainer
	{

		public function HTMLDLNode()
		{
			super(HTMLNodeType.DL);
			
			validNodeTypes.push(	HTMLNodeType.DT,
									HTMLNodeType.DL,
									HTMLNodeType.COMMENT,
									HTMLNodeType.CONDITIONAL
									);
		}
	}
}
