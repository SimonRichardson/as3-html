package org.osflash.html.builders.elements.body
{
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.html.element.HTMLNode;
	import org.osflash.html.element.HTMLNodeContainer;
	import org.osflash.html.element.HTMLNodeType;
	import org.osflash.html.errors.HTMLError;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class HTMLANode extends HTMLNodeContainer
	{

		public function HTMLANode()
		{
			super(HTMLNodeType.A);
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
				case HTMLNodeType.BASE:
				case HTMLNodeType.BODY:
				case HTMLNodeType.HEAD:
				case HTMLNodeType.LINK:
				case HTMLNodeType.META:
				case HTMLNodeType.STYLE:
					throw new HTMLError('You can not add ' + htmlNode.typeName + ' to ' + typeName);
				default: 
					return super.addAt(node, index);			
			}
			
			return null;
		}
	}
}
