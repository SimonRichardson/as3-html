package org.osflash.html.builders.elements.body
{
	import org.osflash.html.element.HTMLNodeType;
	import org.osflash.html.builders.elements.common.HTMLTextNode;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLDELNode extends HTMLTextNode
	{
		
		/**
		 * @private
		 */
		private var _cite : String;
		
		/**
		 * @private
		 */
		private var _date : Date;
		
		public function HTMLDELNode(text : String, cite : String = '', date : Date = null)
		{
			super(HTMLNodeType.DEL, text);
			
			_cite = cite;
			_date = date;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const node : XML = super.write();
			
			if(null != cite && cite.length > 0) node.@cite = cite;
			if(null != date) node.@date = date.toUTCString();
			
			return node;
		}
		
		public function get cite() : String { return _cite; }
		public function set cite(value : String) : void { _cite = value; }

		public function get date() : Date { return _date; }
		public function set date(value : Date) : void { _date = value; }
	}
}
