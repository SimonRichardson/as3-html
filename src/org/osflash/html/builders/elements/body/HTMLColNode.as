package org.osflash.html.builders.elements.body
{
	import org.osflash.html.builders.types.HTMLVAlignType;
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
		
		/**
		 * @private
		 */
		private var _valign : HTMLVAlignType;
		
		public function HTMLColNode(valign : HTMLVAlignType = null, width : * = 0)
		{
			super(HTMLNodeType.COL);
			
			if(null == width) throw new ArgumentError('Width can not be null');
			
			_valign = valign;
			
			_width = new CSSConvertableValue();
			_width.value = width;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const node : XML = super.write();
			
			if(null != valign) node.@valign = valign.name;
			if(null != width) node.@width = width;
			
			return node;
		}

		public function get width() : * { return _width.value; }
		public function set width(value : *) : void { _width.value = value; }

		public function get valign() : HTMLVAlignType { return _valign;	}
		public function set valign(value : HTMLVAlignType) : void { _valign = value; }
	}
}
