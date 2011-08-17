package org.osflash.html.element
{
	import org.osflash.dom.element.DOMElementType;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class HTMLNodeType extends DOMElementType
	{
		
		private static const HTML_NODE : int = 0x100; 
		
		public static const HEAD : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0001, 'head');
		
		public static const STYLE : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0002, 'style');
		
		public static const SCRIPT : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0003, 'script');
		
		public static const BODY : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0004, 'body');
		
		public static const DIV : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0005, 'div');
		
		public static const SPAN : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0006, 'span');
		
		public static const A : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0007, 'a');
		
		public static const IMG : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0008, 'img');

		public static const TITLE : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0009, 'title');
		
		public static const BR : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0010, 'br');
		
		public static const P : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0011, 'p');
		
		public static const COMMENT : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0012, '<!--->');
		
		public static const H1 : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0013, 'h1');
		
		public static const H2 : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0014, 'h2');
		
		public static const H3 : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0015, 'h3');
		
		public static const H4 : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0016, 'h4');
		
		public static const HR : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0017, 'hr');
		
		public static const LINK : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0018, 'link');
		
		/**
		 * @private
		 */
		private var _name : String;
		
		/**
		 * @private
		 */
		private var _value : String;
		
		public function HTMLNodeType(type : int, value : String)
		{
			super(type);
			
			_value = value;
		}
		
		public static function typeAsString(nodeType : HTMLNodeType) : String
		{
			switch(nodeType)
			{
				case A:
				case BODY:
				case BR:
				case COMMENT:
				case DIV:
				case H1: 
				case H2:
				case H3:
				case H4:
				case HEAD:
				case HR:
				case IMG:
				case LINK:
				case P:
				case SCRIPT:
				case STYLE:
				case SPAN:
				case TITLE:
					return nodeType.value;
				default:
					throw new ArgumentError('Unknown HTMLNodeType');
					break;
			}
		}
		
		public function get name() : String 
		{ 
			if(null == _name) _name = typeAsString(this);
			return _name; 
		}
		
		public function get value() : String { return _value; }
	}
}
