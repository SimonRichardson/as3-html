package org.osflash.html.builders.elements.body
{
	import org.osflash.html.element.HTMLNodeType;
	import org.osflash.html.builders.elements.common.HTMLTextNode;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLLabelNode extends HTMLTextNode
	{
		
		/**
		 * @private
		 */
		private var _forElement : String;
		
		public function HTMLLabelNode(text : String, forElement : String = '')
		{
			super(HTMLNodeType.LABEL, text);
			
			_forElement = forElement;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const node : XML = super.write();
			
			if(null != forElement && forElement.length > 0) node.@['for'] = forElement;
			
			return node;
		}

		public function get forElement() : String {	return _forElement;	}
		public function set forElement(value : String) : void { _forElement = value; }
	}
}
