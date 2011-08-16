package org.osflash.html.element
{
	import org.osflash.dom.element.DOMElementType;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class HTMLNodeType extends DOMElementType
	{
		
		private static const HTML_NODE : int = 0x100; 
		
		public static const HEAD : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0001);
		
		public static const STYLE : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0002);
		
		public static const SCRIPT : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0003);
		
		public static const BODY : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0004);
		
		public static const DIV : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0005);
		
		public static const SPAN : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0006);
		
		public static const A : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0007);
		
		public static const IMG : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0008);

		public static const TITLE : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0009);
		
		public static const BR : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0010);
		
		public static const P : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0011);
		
		private var _name : String;
		
		public function HTMLNodeType(type : int)
		{
			super(type);
		}
		
		public static function typeAsString(nodeType : HTMLNodeType) : String
		{
			switch(nodeType)
			{
				case HEAD: return 'head';
				case STYLE: return 'style';
				case SCRIPT: return 'script';
				case BODY: return 'body';
				case DIV: return 'divww';
				case SPAN: return 'span';
				case A: return 'a';
				case IMG: return 'img';
				case TITLE: return 'title';
				case BR: return 'br';
				case P: return 'p';
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
	}
}
