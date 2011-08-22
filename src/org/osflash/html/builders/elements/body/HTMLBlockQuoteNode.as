package org.osflash.html.builders.elements.body
{
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.html.element.HTMLNode;
	import org.osflash.html.element.HTMLNodeContainer;
	import org.osflash.html.element.HTMLNodeType;
	import org.osflash.html.errors.HTMLError;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLBlockQuoteNode extends HTMLNodeContainer
	{

		/**
		 * @private
		 */
		private var _cite : String;

		public function HTMLBlockQuoteNode(cite : String = '')
		{
			super(HTMLNodeType.BLOCK_QUOTE);
			
			_cite = cite;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function addAt(node : IDOMNode, index : int) : IDOMNode
		{
			var htmlNode : HTMLNode;
			if(node is HTMLNode)
				htmlNode = HTMLNode(node);
			else throw new HTMLError('You can not add a none HTMLNode to HTMLNode');
			
			switch(node.type)
			{
				case HTMLNodeType.A:
				case HTMLNodeType.BR:
				case HTMLNodeType.P:
					return super.addAt(node, index);			
				default: 
					throw new HTMLError('You can not add ' + htmlNode.typeName + ' to ' + typeName);
			}
			
			return null;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function write() : XML
		{
			const node : XML = super.write();
			
			if(null != cite && cite.length > 0) node.@cite = cite;
			
			return node;
		}

		public function get cite() : String { return _cite; }
		public function set cite(value : String) : void { _cite = value; }
	}
}
