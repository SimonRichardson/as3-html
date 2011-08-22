package org.osflash.html.builders.elements.body.anchor
{
	import org.osflash.html.element.HTMLNodeContainer;
	import org.osflash.html.element.HTMLNodeType;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class HTMLAnchorNode extends HTMLNodeContainer
	{

		public function HTMLAnchorNode()
		{
			super(HTMLNodeType.A);
			
			invalidNodeTypes.push(	HTMLNodeType.A,
									HTMLNodeType.BASE,
									HTMLNodeType.BODY,
									HTMLNodeType.HEAD,
									HTMLNodeType.LINK,
									HTMLNodeType.META,
									HTMLNodeType.STYLE
									);
		}
	}
}
