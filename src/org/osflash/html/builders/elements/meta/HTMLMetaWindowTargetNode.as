package org.osflash.html.builders.elements.meta
{
	import org.osflash.html.builders.types.HTMLEquivType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLMetaWindowTargetNode extends HTMLMetaEquivTypeNode
	{
		
		/**
		 * @private
		 */
		private var _target : String;

		public function HTMLMetaWindowTargetNode(target : String)
		{
			super(HTMLEquivType.WINDOW_TARGET);
			
			_target = target;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const node : XML = super.write();
			
			node.@content = target;
			
			return node;
		}
		
		public function get target() : String { return _target; }
		public function set target(value : String) : void { _target = value; }
	}
}
