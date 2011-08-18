package org.osflash.html.builders.elements.common.comments
{
	import org.osflash.dom.dom_namespace;
	import org.osflash.dom.element.IDOMElement;
	import org.osflash.html.builders.types.HTMLConditionalType;
	import org.osflash.html.element.HTMLNode;
	import org.osflash.html.element.HTMLNodeContainer;
	import org.osflash.html.element.HTMLNodeType;
	import org.osflash.html.errors.HTMLError;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLConditionalNode extends HTMLNodeContainer
	{
		
		use namespace dom_namespace;
		
		/**
		 * @private
		 */
		private var _conditionalType : HTMLConditionalType;
		
		public function HTMLConditionalNode(conditionalType : HTMLConditionalType)
		{
			super(HTMLNodeType.CONDITIONAL);
			
			_conditionalType = conditionalType;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const buffer : Vector.<String> = new Vector.<String>();
			buffer.push('<!--[if ' + conditionalType.name + ']>');
			
			const total : int = numChildren;
			for(var i : int = 0; i<total; i++)
			{
				const child : IDOMElement = children[i];
				if(child is HTMLNode)
				{
					const htmlChild : HTMLNode = HTMLNode(child);
					buffer.push(htmlChild.write().toXMLString());
				}
				else throw new HTMLError('Node is not of type HTMLNode');
			}
			
			buffer.push('<![endif]-->');
			return new XML(buffer.join(''));
		}
		
		public function get conditionalType() : HTMLConditionalType { return _conditionalType; }
		public function set conditionalType(value : HTMLConditionalType) : void
		{
			_conditionalType = value;
		}
	}
}
