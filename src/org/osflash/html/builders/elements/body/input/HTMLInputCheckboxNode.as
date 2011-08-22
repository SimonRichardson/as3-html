package org.osflash.html.builders.elements.body.input
{
	import org.osflash.html.builders.types.HTMLInputType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLInputCheckboxNode extends HTMLInputNode
	{
		
		/**
		 * @inheritDoc
		 */
		private var _checked : Boolean;
		
		public function HTMLInputCheckboxNode(value : String, checked : Boolean = false)
		{
			if(null == value) throw new ArgumentError('Value can not be null');
			if(value.length == 0) throw new ArgumentError('Value can not be empty');
			
			super(HTMLInputType.CHECKBOX, value);
			
			_checked = checked;
		}

		/**
		 * @inheritDoc
		 */		
		override public function write() : XML
		{
			const node : XML = super.write();
			
			if(checked) node.@checked = 'checked';
			
			return node;
		}

		public function get checked() : Boolean	{ return _checked; }
		public function set checked(value : Boolean) : void { _checked = value; }
	}
}
