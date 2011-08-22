package org.osflash.html.element
{
	import org.osflash.dom.dom_namespace;
	import org.osflash.dom.element.IDOMElement;
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.html.errors.HTMLError;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class HTMLNodeContainer extends HTMLNode
	{
		
		use namespace dom_namespace;

		/**
		 * @inheritDoc
		 */
		private const _validNodeTypes : Vector.<HTMLNodeType> = new Vector.<HTMLNodeType>();
		
		/**
		 * @inheritDoc
		 */
		private const _invalidNodeTypes : Vector.<HTMLNodeType> = new Vector.<HTMLNodeType>();

		public function HTMLNodeContainer(type : HTMLNodeType)
		{
			super(type);
			
			validNodeTypes.push(HTMLNodeType.COMMENT, HTMLNodeType.CONDITIONAL);
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function addAt(node : IDOMNode, index : int) : IDOMNode
		{
			var htmlNode : HTMLNode;
			if (node is HTMLNode)
				htmlNode = HTMLNode(node);
			else throw new HTMLError('You can not add a none HTMLNode to HTMLNode');
			const numValidNodeTypes : int = validNodeTypes.length;
			
			if(numValidNodeTypes > 0)
			{
				if(validNodeTypes.indexOf(node.type) < 0)
					throw new HTMLError('You can not add ' + htmlNode.typeName + ' to ' + typeName);
			}
			
			const numInvalidNodeTypes : int = invalidNodeTypes.length;
			if(numInvalidNodeTypes > 0)
			{
				if(invalidNodeTypes.indexOf(node.type) < 0)
					throw new HTMLError('You can not add ' + htmlNode.typeName + ' to ' + typeName);
			}
			
			return super.addAt(node, index);
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const xml : XML = super.write();
			
			const total : int = numChildren;
			for(var i : int = 0; i<total; i++)
			{
				const child : IDOMElement = children[i];
				if(child is HTMLNode)
				{
					const htmlChild : HTMLNode = HTMLNode(child);
					xml.appendChild(htmlChild.write());
				}
				else throw new HTMLError('Node is not of type HTMLNode');
			}
			
			return xml;
		}

		public function get validNodeTypes() : Vector.<HTMLNodeType> { return _validNodeTypes; }

		public function get invalidNodeTypes() : Vector.<HTMLNodeType> { return _invalidNodeTypes; }
	}
}
