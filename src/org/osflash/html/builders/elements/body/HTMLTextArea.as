package org.osflash.html.builders.elements.body
{
	import org.osflash.html.element.HTMLNodeType;
	import org.osflash.html.element.HTMLNodeContainer;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLTextArea extends HTMLNodeContainer
	{
		
		/**
		 * @private
		 */
		private var _cols : int;
		
		/**
		 * @private
		 */
		private var _rows : int;
		
		/**
		 * @private
		 */
		private var _text : String;
		
		/**
		 * @private
		 */
		private var _disabled : Boolean;
		
		/**
		 * @private
		 */
		private var _readOnly : Boolean;
		
		public function HTMLTextArea(	text : String = '', 
										cols : int = 10, 
										rows : int = 10,
										readOnly : Boolean = false
										)
		{
			super(HTMLNodeType.TEXT_AREA);
			
			_text = text;
			_cols = cols;
			_rows = rows;
			
			_readOnly = readOnly;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const node : XML = super.write();
			
			if(!isNaN(cols) && cols > 0) node.@cols = cols;
			if(!isNaN(rows) && rows > 0) node.@rows = rows;
			
			if(disabled) node.@disabled = disabled;
			if(readOnly) node.@readonly = readOnly;
			
			if(null != text && text.length > 0) node.appendChild(text);
			
			return node;
		}
		
		public function get cols() : int { return _cols; }
		public function set cols(value : int) : void { _cols = value; }
		
		public function get rows() : int { return _rows; }
		public function set rows(value : int) : void { _rows = value; }
		
		public function get disabled() : Boolean { return _disabled; }
		public function set disabled(value : Boolean) : void { _disabled = value; }
		
		public function get text() : String { return _text; }
		public function set text(value : String) : void { _text = value; }
		
		public function get readOnly() : Boolean { return _readOnly; }
		public function set readOnly(value : Boolean) : void { _readOnly = value; }
	}
}
