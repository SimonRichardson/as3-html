package org.osflash.html.element
{
	import org.osflash.dom.dom_namespace;
	import org.osflash.dom.element.DOMDocument;
	import org.osflash.dom.element.IDOMElement;
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.html.errors.HTMLError;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class HTMLDocument extends DOMDocument
	{

		use namespace dom_namespace;
		
		public function HTMLDocument()
		{
			super(false);
		}
		
		public function getElementById(id : String) : HTMLNode
		{
			const nodes : Vector.<IDOMNode> = select('//*.(@id=="' + id + '")');
			if(null != nodes && nodes.length > 0) return nodes[0] as HTMLNode;
			else return null;
		}
		
		public function getElementsByTagName(name : String) : Vector.<HTMLNode>
		{
			const nodes : Vector.<IDOMNode> = select('//*.(@typeName=="' + name + '")');
			if(null != nodes && nodes.length > 0) return Vector.<HTMLNode>(nodes);
			else return new Vector.<HTMLNode>();
		}
		
		public function read(xml : XML) : void
		{
			
		}
			
		public function write() : XML
		{
			const node : XML = <html />;
			
			const total : int = numChildren;
			for(var i : int = 0; i<total; i++)
			{
				const child : IDOMElement = children[i];
				if(child is HTMLNode)
				{
					const htmlChild : HTMLNode = HTMLNode(child);
					node.appendChild(htmlChild.write());
				}
				else throw new HTMLError('Node is not of type HTMLNode');
			}
			
			return node;
		}
	}
}
