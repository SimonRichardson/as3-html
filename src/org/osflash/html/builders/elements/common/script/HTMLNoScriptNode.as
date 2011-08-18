package org.osflash.html.builders.elements.common.script
{
	import org.osflash.html.element.HTMLNodeType;
	import org.osflash.html.element.HTMLNodeContainer;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLNoScriptNode extends HTMLNodeContainer
	{

		public function HTMLNoScriptNode()
		{
			super(HTMLNodeType.NOSCRIPT);
		}
	}
}
