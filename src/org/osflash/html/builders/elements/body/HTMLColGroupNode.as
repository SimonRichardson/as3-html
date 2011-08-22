package org.osflash.html.builders.elements.body
{
	import org.osflash.css.data.CSSConvertableValue;
	import org.osflash.html.builders.types.HTMLVAlignType;
	import org.osflash.html.element.HTMLNodeRestricted;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLColGroupNode extends HTMLNodeRestricted
	{
		
		/**
		 * @private
		 */
		private var _span : int;
		
		/**
		 * @private
		 */
		private var _width : CSSConvertableValue;
		
		/**
		 * @private
		 */
		private var _valign : HTMLVAlignType;
		
		public function HTMLColGroupNode(span : int, valign : HTMLVAlignType = null, width : * = 0)
		{
			super(HTMLNodeType.COL_GROUP);
			
			if(isNaN(span)) throw new ArgumentError('Span can not be NaN');
			if(span < 1) throw new ArgumentError('Span can not be less than 1');
			if(null == width) throw new ArgumentError('Width can not be null');
			
			_span = span;
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

		public function get span() : int { return _span; }
		public function set span(value : int) : void 
		{ 
			if(isNaN(value)) throw new ArgumentError('Value can not be NaN');
			if(value < 1) throw new ArgumentError('Value can not be less than 1');
			
			_span = value; 
		}

		public function get width() : * { return _width.value; }
		public function set width(value : *) : void { _width.value = value; }

		public function get valign() : HTMLVAlignType { return _valign;	}
		public function set valign(value : HTMLVAlignType) : void { _valign = value; }
	}
}
