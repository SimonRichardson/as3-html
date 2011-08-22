package org.osflash.html.builders.elements.body.input
{
	import org.osflash.html.builders.types.HTMLInputType;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLInputResetNode extends HTMLInputNode
	{

		public function HTMLInputResetNode(value : String = 'Reset')
		{
			super(HTMLInputType.RESET, value);
		}
	}
}
