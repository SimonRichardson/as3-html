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
		
		public static const A : HTMLNodeType = new HTMLNodeType('a');
		
		public static const ABBR : HTMLNodeType = new HTMLNodeType('abbr');
		
		public static const ACRONYM : HTMLNodeType = new HTMLNodeType('acronym');
												
		public static const ADDRESS : HTMLNodeType = new HTMLNodeType('address');
		
		public static const B : HTMLNodeType = new HTMLNodeType('b');
		
		public static const BASE : HTMLNodeType = new HTMLNodeType('base');
		
		public static const BIG : HTMLNodeType = new HTMLNodeType('big');
		
		public static const BLOCK_QUOTE : HTMLNodeType = new HTMLNodeType('blockquote');
												
		public static const BODY : HTMLNodeType = new HTMLNodeType('body');
													
		public static const BR : HTMLNodeType = new HTMLNodeType('br');
		
		public static const BUTTON : HTMLNodeType = new HTMLNodeType('button');
		
		public static const CAPTION : HTMLNodeType = new HTMLNodeType('caption');
		
		public static const CDATA : HTMLNodeType = new HTMLNodeType('CDATA');
		
		public static const COL : HTMLNodeType = new HTMLNodeType('col');
		
		public static const COL_GROUP : HTMLNodeType = new HTMLNodeType('colgroup');
		
		public static const COMMENT : HTMLNodeType = new HTMLNodeType('<!--->');
		
		public static const CONDITIONAL : HTMLNodeType = new HTMLNodeType('<!--[]-->');
		
		public static const DD : HTMLNodeType = new HTMLNodeType('dd');
		
		public static const DEL : HTMLNodeType = new HTMLNodeType('del');
		
		public static const DIV : HTMLNodeType = new HTMLNodeType('div');
		
		public static const DL : HTMLNodeType = new HTMLNodeType('dl');
		
		public static const DT : HTMLNodeType = new HTMLNodeType('dt');
		
		public static const FIELDSET : HTMLNodeType = new HTMLNodeType('fieldset');
		
		public static const FORM : HTMLNodeType = new HTMLNodeType('form');
		
		public static const HEAD : HTMLNodeType = new HTMLNodeType('head');
		
		public static const H1 : HTMLNodeType = new HTMLNodeType('h1');
		
		public static const H2 : HTMLNodeType = new HTMLNodeType('h2');
		
		public static const H3 : HTMLNodeType = new HTMLNodeType('h3');
		
		public static const H4 : HTMLNodeType = new HTMLNodeType('h4');
		
		public static const H5 : HTMLNodeType = new HTMLNodeType('h5');
		
		public static const H6 : HTMLNodeType = new HTMLNodeType('h6');
		
		public static const HR : HTMLNodeType = new HTMLNodeType('hr');
		
		public static const IMG : HTMLNodeType = new HTMLNodeType('img');
		
		public static const INPUT : HTMLNodeType = new HTMLNodeType('input');
		
		public static const INS : HTMLNodeType = new HTMLNodeType('ins');
		
		public static const LABEL : HTMLNodeType = new HTMLNodeType('label');
		
		public static const LEGEND : HTMLNodeType = new HTMLNodeType('legend');
		
		public static const LI : HTMLNodeType = new HTMLNodeType('li');
		
		public static const LINK : HTMLNodeType = new HTMLNodeType('link');
		
		public static const META : HTMLNodeType = new HTMLNodeType('meta');
		
		public static const NOSCRIPT : HTMLNodeType = new HTMLNodeType('noscript');
		
		public static const OL : HTMLNodeType = new HTMLNodeType('ol');
		
		public static const OPT_GROUP : HTMLNodeType = new HTMLNodeType('optgroup');
		
		public static const OPTION : HTMLNodeType = new HTMLNodeType('option');
		
		public static const P : HTMLNodeType = new HTMLNodeType('p');
		
		public static const PRE : HTMLNodeType = new HTMLNodeType('pre');
		
		public static const Q : HTMLNodeType = new HTMLNodeType('q');
		
		public static const RAW_TEXT : HTMLNodeType = new HTMLNodeType('RAW');
		
		public static const SCRIPT : HTMLNodeType = new HTMLNodeType('script');
		
		public static const SELECT : HTMLNodeType = new HTMLNodeType('select');
		
		public static const SMALL : HTMLNodeType = new HTMLNodeType('small');
		
		public static const SPAN : HTMLNodeType = new HTMLNodeType('span');
		
		public static const STYLE : HTMLNodeType = new HTMLNodeType('style');
		
		public static const SUB : HTMLNodeType = new HTMLNodeType('sub');
		
		public static const SUP : HTMLNodeType = new HTMLNodeType('sup');

		public static const TABLE : HTMLNodeType = new HTMLNodeType('table');

		public static const TBODY : HTMLNodeType = new HTMLNodeType('tbody');
		
		public static const TD : HTMLNodeType = new HTMLNodeType('td');
		
		public static const TEXT_AREA : HTMLNodeType = new HTMLNodeType('textarea');
		
		public static const TFOOT : HTMLNodeType = new HTMLNodeType('tfoot');
		
		public static const TH : HTMLNodeType = new HTMLNodeType('th');
		
		public static const THEAD : HTMLNodeType = new HTMLNodeType('thead');
		
		public static const TITLE : HTMLNodeType = new HTMLNodeType('title');
		
		public static const TR : HTMLNodeType = new HTMLNodeType('tr');
		
		public static const UL : HTMLNodeType = new HTMLNodeType('ul');
		
		
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
				case COL_GROUP:
				case COMMENT:
				case CONDITIONAL:
				case DD:
				case DEL:
				case DIV:
				case DL:
				case DT:
				case FIELDSET:
				case FORM:
				case H1: 
				case H2:
				case H3:
				case H4:
				case H5:
				case H6:
				case HEAD:
				case HR:
				case IMG:
				case INPUT:
				case INS:
				case LABEL:
				case LEGEND:
				case LI:
				case LINK:
				case META:
				case NOSCRIPT:
				case OL:
				case OPT_GROUP:
				case OPTION:
				case P:
				case PRE:
				case Q:
				case RAW_TEXT:
				case SELECT:
				case SCRIPT:
				case SMALL:
				case STYLE:
				case SPAN:
				case SUB:
				case SUP:
				case TABLE:
				case TBODY:
				case TD:
				case TEXT_AREA:
				case TFOOT:
				case TH:
				case THEAD:
				case TITLE:
				case TR:
				case UL:
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
