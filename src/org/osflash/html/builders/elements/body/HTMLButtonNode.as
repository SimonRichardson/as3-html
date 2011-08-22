package org.osflash.html.builders.elements.body
{
	import org.osflash.html.builders.types.HTMLButtonType;
	import org.osflash.html.builders.elements.common.HTMLTextNode;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLButtonNode extends HTMLTextNode
	{
		
		/**
		 * @private
		 */
		private var _buttonType : HTMLButtonType;

		public function HTMLButtonNode(text : String, buttonType : HTMLButtonType)
		{
			super(HTMLNodeType.BUTTON, text);
			
			if(null == buttonType) throw new ArgumentError('ButtonType can not be null');
			
			_buttonType = buttonType;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const node : XML = super.write();
			
			node.@type = buttonType.name;
			
			return node;
		}

		public function get buttonType() : HTMLButtonType { return _buttonType; }
		public function set buttonType(value : HTMLButtonType) : void 
		{ 
			if(null == value) throw new ArgumentError('value can not be null');
			
			_buttonType = value; 
		}
	}
}
