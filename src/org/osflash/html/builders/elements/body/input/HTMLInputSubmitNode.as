package org.osflash.html.builders.elements.body.input
{
	import org.osflash.html.builders.types.HTMLInputType;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLInputSubmitNode extends HTMLInputNode
	{

		public function HTMLInputSubmitNode(value : String = 'Submit')
		{
			super(HTMLInputType.SUBMIT, value);
		}
	}
}
