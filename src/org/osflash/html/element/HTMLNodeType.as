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
		
		public static const H5 : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0017, 'h5');
		
		public static const H6 : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0018, 'h6');
		
		public static const HR : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0019, 'hr');
		
		public static const LINK : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0020, 'link');
		
		public static const META : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0021, 'meta');
		
		public static const BASE : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0022, 'base');
		
		public static const NOSCRIPT : HTMLNodeType = 
												new HTMLNodeType(HTML_NODE | 0x0023, 'noscript');
		
		public static const CONDITIONAL : HTMLNodeType = 
												new HTMLNodeType(HTML_NODE | 0x0024, '<!--[]-->');
		
		public static const RAW_TEXT : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0025, 'RAW');
		
		public static const CDATA : HTMLNodeType = new HTMLNodeType(HTML_NODE | 0x0026, 'CDATA');
		
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
				case BASE:
				case BODY:
				case BR:
				case CDATA:
				case COMMENT:
				case CONDITIONAL:
				case DIV:
				case H1: 
				case H2:
				case H3:
				case H4:
				case H5:
				case H6:
				case HEAD:
				case HR:
				case IMG:
				case LINK:
				case META:
				case NOSCRIPT:
				case P:
				case RAW_TEXT:
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
