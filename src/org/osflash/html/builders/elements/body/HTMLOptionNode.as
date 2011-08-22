package org.osflash.html.builders.elements.body
{
	import org.osflash.html.builders.elements.common.HTMLTextNode;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLOptionNode extends HTMLTextNode
	{
		
		
		/**
		 * @private
		 */
		private var _disabled : Boolean;
		
		/**
		 * @private
		 */
		private var _selected : Boolean;
		
		/**
		 * @private
		 */
		private var _value : String;
		
		/**
		 * @private
		 */
		private var _label : String;
		
		public function HTMLOptionNode(	text : String, 
										value : String = '',
										label : String = '')
		{
			super(HTMLNodeType.OPTION, text);
			
			_value = value;
			_label = label;
		}
		
		
		override public function write() : XML
		{
			const node : XML = super.write();
			
			node.@value = value;
			
			if(null != label && label.length > 0) node.@label = label;
			if(disabled) node.@disabled = 'disabled';
			if(selected) node.@selected = 'selected';
			
			return node;
		}
		
		public function get value() : String { return _value; }
		public function set value(arg : String) : void { _value = arg; }
		
		public function get label() : String { return _label; }
		public function set label(value : String) : void { _label = value; }
		
		public function get disabled() : Boolean { return _disabled; }
		public function set disabled(value : Boolean) : void { _disabled = value; }

		public function get selected() : Boolean { return _selected; }
		public function set selected(value : Boolean) : void { _selected = value; }
	}
}
