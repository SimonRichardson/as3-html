package org.osflash.html.builders.elements.common
{
	import org.osflash.html.element.HTMLNodeType;
	import org.osflash.html.element.HTMLNodeRestricted;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLCommentNode extends HTMLNodeRestricted
	{
		
		/**
		 * @private
		 */
		private var _comment : String;
		
		public function HTMLCommentNode(comment : String = '')
		{
			super(HTMLNodeType.COMMENT);
			
			_comment = comment;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			// We have to do it this way because there is bug with comments and E4X
			return new XML('<!-- ' + comment + ' -->');
		}
		
		public function get comment() : String { return _comment; }
	}
}
