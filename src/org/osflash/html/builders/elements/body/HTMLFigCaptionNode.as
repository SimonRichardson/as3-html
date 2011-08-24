package org.osflash.html.builders.elements.body
{
	import org.osflash.html.builders.types.HTMLRevisionType;
	import org.osflash.html.element.HTMLNodeContainer;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLFigCaptionNode extends HTMLNodeContainer
	{

		public function HTMLFigCaptionNode()
		{
			super(HTMLNodeType.FIG_CAPTION);
			
			revision = HTMLRevisionType.HTML_5;
			
			validNodeTypes.push(HTMLNodeType.A, HTMLNodeType.BR, HTMLNodeType.P, HTMLNodeType.SPAN);
		}
	}
}
