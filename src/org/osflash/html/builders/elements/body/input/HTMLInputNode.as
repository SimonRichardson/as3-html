package org.osflash.html.builders.elements.body.input
{
	import org.osflash.html.builders.types.HTMLInputType;
	import org.osflash.html.element.HTMLNodeRestricted;
	import org.osflash.html.element.HTMLNodeType;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLInputNode extends HTMLNodeRestricted
	{
		
		/**
		 * @private
		 */
		private var _inputType : HTMLInputType;
		
		/**
		 * @private
		 */
		private var _value : String;
		
		/**
		 * @private
		 */
		private var _disabled : Boolean;

		public function HTMLInputNode(inputType : HTMLInputType, value : String = '')
		{
			super(HTMLNodeType.INPUT);
			
			if(null == inputType) throw new ArgumentError('inputType can not be null');
			
			_disabled = false;
			_inputType = inputType;
			_value = value;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const node : XML = super.write();
			
			node.@type = inputType.name;
			if(null != value && value.length > 0) node.@value = value; 
			if(disabled) node.@disabled = 'disabled';
			
			return node;
		}

		public function get inputType() : HTMLInputType { return _inputType; }

		public function get disabled() : Boolean { return _disabled; }
		public function set disabled(value : Boolean) : void { _disabled = value; }
		
		public function get value() : String { return _value; }
		public function set value(arg : String) : void { _value = arg; }
	}
}
