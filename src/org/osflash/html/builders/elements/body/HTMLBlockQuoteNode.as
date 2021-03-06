package org.osflash.html.builders.elements.body
{
	import org.osflash.html.element.HTMLNodeContainer;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLBlockQuoteNode extends HTMLNodeContainer
	{

		/**
		 * @private
		 */
		private var _cite : String;

		public function HTMLBlockQuoteNode(cite : String = '')
		{
			super(HTMLNodeType.BLOCK_QUOTE);
			
			_cite = cite;
			
			validNodeTypes.push(	HTMLNodeType.A,
									HTMLNodeType.BR,
									HTMLNodeType.P
									);
		}
				
		/**
		 * @inheritDoc
		 */
		override public function write() : XML
		{
			const node : XML = super.write();
			
			if(null != cite && cite.length > 0) node.@cite = cite;
			
			return node;
		}

		public function get cite() : String { return _cite; }
		public function set cite(value : String) : void { _cite = value; }
	}
}
