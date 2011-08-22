package org.osflash.html.builders.elements.body.input
{
	import org.osflash.html.builders.types.HTMLInputType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLInputTextNode extends HTMLInputNode
	{
		
		/**
		 * @private
		 */
		private var _maxLength : int;
		
		/**
		 * @private
		 */
		private var _readOnly : Boolean;
		
		public function HTMLInputTextNode(	value : String = '',
												maxLength : int = -1,
												readOnly : Boolean = false
												)
		{
			super(HTMLInputType.TEXT);
			
			this.value = value;
			
			_maxLength = maxLength;
			_readOnly = readOnly;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const node : XML = super.write();
			
			if(!isNaN(maxLength) && maxLength > 0) node.@maxlength = maxLength;
			if(readOnly) node.@readonly = readOnly;
			
			return node;
		}

		public function get maxLength() : int { return _maxLength; }
		public function set maxLength(value : int) : void { _maxLength = value; }

		public function get readOnly() : Boolean { return _readOnly; }
		public function set readOnly(value : Boolean) : void { _readOnly = value; }
	}
}
