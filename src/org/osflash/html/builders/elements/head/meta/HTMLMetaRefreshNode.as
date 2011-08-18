package org.osflash.html.builders.elements.head.meta
{
	import org.osflash.html.builders.types.HTMLEquivType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLMetaRefreshNode extends HTMLMetaEquivTypeNode
	{
		
		/**
		 * @private
		 */
		private var _time : int;

		public function HTMLMetaRefreshNode(time : int)
		{
			super(HTMLEquivType.REFRESH);
			
			_time = time;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const node : XML = super.write();
			
			node.@content = time;
			
			return node;
		}
		
		public function get time() : int { return _time; }
		public function set time(value : int) : void { _time = value; }
	}
}
