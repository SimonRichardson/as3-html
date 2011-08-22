package org.osflash.html.builders.elements.common
{
	import org.osflash.html.element.HTMLNodeRestricted;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLTextNode extends HTMLNodeRestricted implements IHTMLRawTextNode
	{
		
		/**
		 * @private
		 */
		private var _text : String;

		public function HTMLTextNode(nodeType : HTMLNodeType, text : String)
		{
			super(nodeType);
			
			if(null == text) throw new ArgumentError('Text can not be null');
			if(text.length == 0) throw new ArgumentError('Text can not be empty');
			_text = text;
		}
				
		/**
		 * @inheritDoc
		 */
		override public function write() : XML
		{
			const node : XML = super.write();
			
			node.appendChild(text);
			
			return node;
		}

		public function get text() : String { return _text; }
		public function set text(value : String) : void 
		{ 
			if(null == value) throw new ArgumentError('Value can not be null');
			if(value.length == 0) throw new ArgumentError('Value can not be empty');
			
			_text = value; 
		}
	}
}
