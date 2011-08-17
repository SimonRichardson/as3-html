package org.osflash.html.builders.elements.meta
{
	import org.osflash.html.builders.types.HTMLEquivType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLMetaLastModifiedNode extends HTMLMetaEquivTypeNode
	{
		
		/**
		 * @private
		 */
		private var _date : Date;

		public function HTMLMetaLastModifiedNode(date : Date)
		{
			super(HTMLEquivType.DATE);
			
			_date = date;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const node : XML = super.write();
			
			node.@content = date.toUTCString();
			
			return node;
		}
		
		public function get date() : Date { return _date; }
		public function set date(value : Date) : void { _date = value; }
	}
}
