package org.osflash.html.builders.elements.meta
{
	import org.osflash.html.builders.types.HTMLEquivType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLMetaLocationNode extends HTMLMetaEquivTypeNode
	{
		
		/**
		 * @private
		 */
		private var _location : String;

		public function HTMLMetaLocationNode(location : String)
		{
			super(HTMLEquivType.LOCATION);
			
			_location = location;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const node : XML = super.write();
			
			node.@content = 'URL=' + location;
			
			return node;
		}
		
		public function get location() : String { return _location; }
		public function set location(value : String) : void { _location = value; }
	}
}
