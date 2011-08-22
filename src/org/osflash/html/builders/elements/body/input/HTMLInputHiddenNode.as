package org.osflash.html.builders.elements.body.input
{
	import org.osflash.html.builders.types.HTMLInputType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLInputHiddenNode extends HTMLInputNode
	{
		
		public function HTMLInputHiddenNode(name : String, value : String)
		{
			if(null == value) throw new ArgumentError('Value can not be null');
			if(value.length == 0) throw new ArgumentError('Value can not be empty');
			
			super(HTMLInputType.HIDDEN, value);
			
			this.name = name;
		}
	}
}
