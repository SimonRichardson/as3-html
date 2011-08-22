package org.osflash.html.builders.elements.body
{
	import org.osflash.html.element.HTMLNodeContainer;
	import org.osflash.html.element.HTMLNodeType;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class HTMLBodyNode extends HTMLNodeContainer
	{
		
		public function HTMLBodyNode()
		{
			super(HTMLNodeType.BODY);
			
			invalidNodeTypes.push(	HTMLNodeType.BASE, 
									HTMLNodeType.BODY, 
									HTMLNodeType.HEAD,
									HTMLNodeType.LINK,
									HTMLNodeType.META
									);
		}
	}
}
