package org.osflash.html.builders.elements.body.input
{
	import org.osflash.html.builders.types.HTMLInputType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLInputButtonNode extends HTMLInputNode
	{

		public function HTMLInputButtonNode(value : String)
		{
			super(HTMLInputType.BUTTON, value);
			
			if(null == value) throw new ArgumentError('Value can not be null');
			if(value.length == 0) throw new ArgumentError('Value can not be empty');
		}
	}
}
