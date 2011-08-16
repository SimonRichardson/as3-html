package org.osflash.html.element
{
	import org.osflash.dom.dom_namespace;
	import org.osflash.dom.element.IDOMElement;
	import org.osflash.html.errors.HTMLError;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class HTMLNodeContainer extends HTMLNode
	{
		
		use namespace dom_namespace;

		public function HTMLNodeContainer(type : HTMLNodeType)
		{
			super(type);
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write(xml : XML) : void
		{
			const node : XML = <{typeName} />;
			
			if(classes.length > 0) classes.write(node);
			
			const total : int = numChildren;
			for(var i : int = 0; i<total; i++)
			{
				const child : IDOMElement = children[i];
				if(child is HTMLNode)
				{
					const htmlChild : HTMLNode = HTMLNode(child);
					htmlChild.write(node);
				}
				else throw new HTMLError('Node is not of type HTMLNode');
			}
			
			xml.appendChild(node);
		}
	}
}
