package org.osflash.html.builders.elements
{
	import org.osflash.html.element.HTMLNodeRestrictedContainer;
	import org.osflash.html.element.HTMLNodeType;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class HTMLScriptNode extends HTMLNodeRestrictedContainer
	{

		public function HTMLScriptNode()
		{
			super(HTMLNodeType.SCRIPT);
		}
	}
}
