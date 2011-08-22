package org.osflash.html.builders.elements.body
{
	import org.osflash.html.element.HTMLNodeType;
	import org.osflash.html.element.HTMLNodeContainer;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLSelectNode extends HTMLNodeContainer
	{

		public function HTMLSelectNode()
		{
			super(HTMLNodeType.SELECT);
			
			validNodeTypes.push(HTMLNodeType.OPTION, HTMLNodeType.OPT_GROUP);
		}

	}
}
