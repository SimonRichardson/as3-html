package org.osflash.html.builders.elements.body
{
	import org.osflash.html.element.HTMLNodeRestricted;
	import org.osflash.html.element.HTMLNodeType;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLABBRNode extends HTMLNodeRestricted
	{
		
		/**
		 * @private
		 */
		private var _text : String;
				
		public function HTMLABBRNode(text : String, title : String)
		{
			super(HTMLNodeType.ABBR);
			
			if(null == text) throw new ArgumentError('Text can not be null');
			if(text.length == 0) throw new ArgumentError('Text can not be empty');
			if(null == title) throw new ArgumentError('Title can not be null');
			if(title.length == 0) throw new ArgumentError('Title can not be empty');
			
			_text = text;
			
			this.title = title;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const node : XML = super.write();
			
			node.appendChild(text);
			
			return node;
		}

		public function get text() : String { return _text; }
		public function set text(value : String) : void 
		{ 
			if(null == text) throw new ArgumentError('Value can not be null');
			if(text.length == 0) throw new ArgumentError('Value can not be empty');
			
			_text = value;
		}

		/**
		 * @inheritDoc
		 */
		override public function set title(value : String) : void
		{
			if(null == value) throw new ArgumentError('Value can not be null');
			if(value.length == 0) throw new ArgumentError('Value can not be empty');
			
			super.title = value;
		}
	}
}
