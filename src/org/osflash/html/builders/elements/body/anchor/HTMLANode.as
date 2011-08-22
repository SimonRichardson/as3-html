package org.osflash.html.builders.elements.body.anchor
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class HTMLANode extends HTMLAnchorNode
	{

		/**
		 * @private
		 */
		private var _href : String;
		
		/**
		 * @private
		 */
		private var _target : String;
		
		public function HTMLANode(href : String, target : String = null)
		{
			if(null == href) throw new ArgumentError('Href can not be null');
			if(href.length == 0) throw new ArgumentError('Href can not be empty');
			
			_href = href;
			_target = target;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const node : XML = super.write();
			
			node.@href = href;
			if(null != _target) node.@target = target;
			
			return node;
		}

		public function get href() : String { return _href;	}
		public function set href(value : String) : void
		{
			if(null == value) throw new ArgumentError('Value can not be null');
			if(value.length == 0) throw new ArgumentError('Value can not be empty');
			
			_href = value;
		}

		public function get target() : String { return _target; }
		public function set target(value : String) : void {	_target = value; }
	}
}
