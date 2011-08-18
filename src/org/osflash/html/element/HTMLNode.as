package org.osflash.html.element
{
	import org.osflash.html.errors.HTMLError;
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.css.classes.CSSClasses;
	import org.osflash.dom.element.DOMNode;
	import org.osflash.dom.element.IDOMElementType;
	import org.osflash.html.utils.getUniqueName;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class HTMLNode extends DOMNode
	{
		
		/**
		 * @private
		 */
		private var _type : HTMLNodeType;
		
		/**
		 * @private
		 */
		private var _classes : CSSClasses;
		
		public function HTMLNode(type : HTMLNodeType)
		{
			super(getUniqueName());
			
			if(null == type) throw new ArgumentError('type can not be null');
			
			_type = type;
			
			_classes = new CSSClasses();
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function addAt(node : IDOMNode, index : int) : IDOMNode
		{
			if(!(node is HTMLNode)) 
			{
				throw new HTMLError('IllegalOperationError: You can not add ' + 
												' a none HTMLNode to a HTMLNode');
			}
			
			return super.addAt(node, index);
		}
		
		public function write() : XML
		{
			const node : XML = <{typeName} />;
			
			if(null != id && id.length > 0) node.@id = id;
			
			if(!(this is IHTMLNodeRestricted))
				if(classes.length > 0) classes.write(node);
				
			return node;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get type() : IDOMElementType { return _type; }
		
		public function get typeName() : String { return _type.name; }
		
		public function get classes() : CSSClasses { return _classes; }
		
		/**
		 * @inheritDoc
		 */	
		override public function toString() : String
		{
			return '[HTMLNode (type=\'' + typeName + '\', name=\'' + name + '\']';
		}
	}
}
