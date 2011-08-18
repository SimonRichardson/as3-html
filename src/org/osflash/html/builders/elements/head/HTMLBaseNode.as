package org.osflash.html.builders.elements.head
{
	import org.osflash.html.element.HTMLNodeType;
	import org.osflash.html.element.HTMLNodeRestricted;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLBaseNode extends HTMLNodeRestricted
	{

		/**
		 * @private
		 */
		private var _href : String;
		
		/**
		 * @private
		 */
		private var _target : String;

		public function HTMLBaseNode(href : String = null, target : String = null)
		{
			super(HTMLNodeType.BASE);
			
			_href = href;
			_target = target;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const node : XML = super.write();
			
			if(null != href) node.@href = href;
			if(null != target) node.@target = target;
			
			return node;
		}

		public function get href() : String { return _href; }
		public function set href(value : String) : void { _href = value; }

		public function get target() : String { return _target; }
		public function set target(value : String) : void { _target = value; }
	}
}
