package org.osflash.html.element
{
	import org.osflash.dom.element.DOMElementType;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class HTMLNodeType extends DOMElementType
	{
		
		private static const HTML_NODE : int = 0x100;
		
		private static var HTML_NODE_ID : int = 0;
		
		public static const HEAD : HTMLNodeType = new HTMLNodeType('head');
		
		public static const STYLE : HTMLNodeType = new HTMLNodeType('style');
		
		public static const SCRIPT : HTMLNodeType = new HTMLNodeType('script');
		
		public static const DIV : HTMLNodeType = new HTMLNodeType('div');
		
		public static const SPAN : HTMLNodeType = new HTMLNodeType('span');
		
		public static const IMG : HTMLNodeType = new HTMLNodeType('img');

		public static const TITLE : HTMLNodeType = new HTMLNodeType('title');
		
		public static const P : HTMLNodeType = new HTMLNodeType('p');
		
		public static const H1 : HTMLNodeType = new HTMLNodeType('h1');
		
		public static const H2 : HTMLNodeType = new HTMLNodeType('h2');
		
		public static const H3 : HTMLNodeType = new HTMLNodeType('h3');
		
		public static const H4 : HTMLNodeType = new HTMLNodeType('h4');
		
		public static const H5 : HTMLNodeType = new HTMLNodeType('h5');
		
		public static const H6 : HTMLNodeType = new HTMLNodeType('h6');
		
		public static const HR : HTMLNodeType = new HTMLNodeType('hr');
		
		public static const LINK : HTMLNodeType = new HTMLNodeType('link');
		
		public static const META : HTMLNodeType = new HTMLNodeType('meta');
		
		public static const BASE : HTMLNodeType = new HTMLNodeType('base');
		
		public static const NOSCRIPT : HTMLNodeType = new HTMLNodeType('noscript');
		
		public static const RAW_TEXT : HTMLNodeType = new HTMLNodeType('RAW');
		
		// ORGANISED >>
		
		public static const A : HTMLNodeType = new HTMLNodeType('a');
		
		public static const ABBR : HTMLNodeType = new HTMLNodeType('abbr');
		
		public static const ACRONYM : HTMLNodeType = new HTMLNodeType('acronym');
												
		public static const ADDRESS : HTMLNodeType = new HTMLNodeType('address');
		
		public static const B : HTMLNodeType = new HTMLNodeType('b');
		
		public static const BIG : HTMLNodeType = new HTMLNodeType('big');
		
		public static const BLOCK_QUOTE : HTMLNodeType = new HTMLNodeType('blockquote');
												
		public static const BODY : HTMLNodeType = new HTMLNodeType('body');
													
		public static const BR : HTMLNodeType = new HTMLNodeType('br');
		
		public static const BUTTON : HTMLNodeType = new HTMLNodeType('button');
		
		public static const CAPTION : HTMLNodeType = new HTMLNodeType('caption');
		
		public static const CDATA : HTMLNodeType = new HTMLNodeType('CDATA');
		
		public static const COL : HTMLNodeType = new HTMLNodeType('col');
		
		public static const COMMENT : HTMLNodeType = new HTMLNodeType('<!--->');
		
		public static const CONDITIONAL : HTMLNodeType = new HTMLNodeType('<!--[]-->');
		
		/**
		 * @private
		 */
		private var _name : String;
		
		/**
		 * @private
		 */
		private var _value : String;
		
		public function HTMLNodeType(value : String)
		{
			super(HTML_NODE | (HTML_NODE_ID++));
			
			_value = value;
		}
		
		public static function typeAsString(nodeType : HTMLNodeType) : String
		{
			switch(nodeType)
			{
				case A:
				case ABBR:
				case ACRONYM:
				case ADDRESS:
				case B:
				case BASE:
				case BIG:
				case BLOCK_QUOTE:
				case BODY:
				case BR:
				case BUTTON:
				case CAPTION:
				case CDATA:
				case COL:
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
