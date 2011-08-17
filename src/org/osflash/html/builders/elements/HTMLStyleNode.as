package org.osflash.html.builders.elements
{
	import org.osflash.html.element.HTMLNodeType;
	import org.osflash.html.element.HTMLNodeRestrictedContainer;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class HTMLStyleNode extends HTMLNodeRestrictedContainer
	{

		public function HTMLStyleNode()
		{
			super(HTMLNodeType.STYLE);
		}
	}
}
