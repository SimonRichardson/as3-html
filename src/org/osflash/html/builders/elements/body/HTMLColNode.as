package org.osflash.html.builders.elements.body
{
	import org.osflash.css.data.CSSConvertableValue;
	import org.osflash.html.element.HTMLNodeRestricted;
	import org.osflash.html.element.HTMLNodeType;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLColNode extends HTMLNodeRestricted
	{
		
		/**
		 * @private
		 */
		private var _width : CSSConvertableValue;

		public function HTMLColNode(width : *)
		{
			super(HTMLNodeType.COL);
			
			if(null == width) throw new ArgumentError('Width can not be null');
			
			_width = new CSSConvertableValue();
			_width.value = width;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const node : XML = super.write();
			
			node.@width = width;
			
			return node;
		}

		public function get width() : * { return _width.value; }
		public function set width(value : *) : void { _width.value = value; }
	}
}
