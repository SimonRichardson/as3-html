package org.osflash.html.builders.elements.head
{
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.html.element.HTMLNode;
	import org.osflash.html.element.HTMLNodeRestrictedContainer;
	import org.osflash.html.element.HTMLNodeType;
	import org.osflash.html.errors.HTMLError;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class HTMLHeadNode extends HTMLNodeRestrictedContainer
	{

		public function HTMLHeadNode()
		{
			super(HTMLNodeType.HEAD);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function addAt(node : IDOMNode, index : int) : IDOMNode
		{
			switch(node.type.type)
			{
				case HTMLNodeType.TITLE.type:
				case HTMLNodeType.BASE.type:
				case HTMLNodeType.LINK.type:
				case HTMLNodeType.META.type:
				case HTMLNodeType.SCRIPT.type:
				case HTMLNodeType.STYLE.type:
					return super.addAt(node, index);
				default:
					if(node is HTMLNode)
					{
						const htmlNode : HTMLNode = HTMLNode(node);
						throw new HTMLError('You can not add ' + htmlNode.typeName + 
																				' to ' + typeName);
					}
					else throw new HTMLError('You can not add a none HTMLNode to HTMLNode');
			}
		}
	}
}
