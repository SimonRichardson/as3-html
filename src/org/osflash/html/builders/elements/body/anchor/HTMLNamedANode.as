package org.osflash.html.builders.elements.body.anchor
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class HTMLNamedANode extends HTMLAnchorNode
	{
		
		/**
		 * @private
		 */
		private var _nameValue : String;

		public function HTMLNamedANode(nameValue : String)
		{
			super();
			
			if(null == nameValue) throw new ArgumentError('NameValue can not be null');
			if(nameValue.length == 0) throw new ArgumentError('NameValue can not be empty');
			
			_nameValue = nameValue;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const node : XML = super.write();
			
			node.@name = nameValue;
			
			return node;
		}
		
		public function get nameValue() : String { return _nameValue; }
		public function set nameValue(value : String) : void
		{
			if(null == nameValue) throw new ArgumentError('NameValue can not be null');
			if(nameValue.length == 0) throw new ArgumentError('NameValue can not be empty');
			
			_nameValue = value;
		}
	}
}
