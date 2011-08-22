package org.osflash.html.builders.elements.body
{
	import org.osflash.html.element.HTMLNodeContainer;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLDTNode extends HTMLNodeContainer
	{

		public function HTMLDTNode()
		{
			super(HTMLNodeType.DT);
			
			validNodeTypes.push(	HTMLNodeType.A,
									HTMLNodeType.ABBR,
									HTMLNodeType.ACRONYM,
									HTMLNodeType.COMMENT,
									HTMLNodeType.CONDITIONAL,
									HTMLNodeType.DEL,
									HTMLNodeType.H1,
									HTMLNodeType.H2,
									HTMLNodeType.H3,
									HTMLNodeType.H4,
									HTMLNodeType.H5,
									HTMLNodeType.H6,
									HTMLNodeType.P,
									HTMLNodeType.SPAN
									);
		}
	}
}
