package org.osflash.html.element
{
	import org.osflash.css.CSSInlineStyle;
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
		private var _title : String;
		
		/**
		 * @private
		 */
		private var _accessKey : String;
		
		/**
		 * @private
		 */
		private var _tabIndex : int;
		
		/**
		 * @private
		 */
		private var _classes : CSSClasses;
		
		/**
		 * @private
		 */
		private var _inlineStyle : CSSInlineStyle;
		
		public function HTMLNode(type : HTMLNodeType)
		{
			super(getUniqueName());
			
			if(null == type) throw new ArgumentError('type can not be null');
			
			_type = type;
			_tabIndex = -1;
			
			_classes = new CSSClasses();
			_inlineStyle = new CSSInlineStyle(name);
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
			if(null != title && title.length > 0) node.@title = title;
			
			if(null != accessKey && accessKey.length > 0) node.@accesskey = accessKey;
			if(tabIndex >= 0) node.@tabindex = tabIndex;
			
			if(!(this is IHTMLNodeRestricted))
			{
				if(classes.length > 0) node.@['class'] = classes.write();
				if(inlineStyles.hasValidProperties()) inlineStyles.@style = inlineStyles.write();
			}
			
			return node;
		}
		
		/**
		 * @inheritDoc
		 */
		override final public function get type() : IDOMElementType { return _type; }
		
		/**
		 * @inheritDoc
		 */	
		override public function set name(value : String) : void
		{
			super.name = value;
			
			_inlineStyle.name = value;
		}
		
		public function get typeName() : String { return _type.name; }
		
		public function get classes() : CSSClasses { return _classes; }
		public function get inlineStyles() : CSSInlineStyle { return _inlineStyle; }
		
		public function get title() : String { return _title; }
		public function set title(value : String) : void { _title = value; }
		
		public function get accessKey() : String { return _accessKey; }
		public function set accessKey(value : String) : void { _accessKey = value; }
		
		public function get tabIndex() : int { return _tabIndex; }
		public function set tabIndex(value : int) : void { _tabIndex = value; }
		
		/**
		 * @inheritDoc
		 */	
		override public function toString() : String
		{
			return '[HTMLNode (type=\'' + typeName + '\', name=\'' + name + '\']';
		}
	}
}
