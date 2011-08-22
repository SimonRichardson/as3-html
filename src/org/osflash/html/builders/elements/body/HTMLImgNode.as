package org.osflash.html.builders.elements.body
{
	import org.osflash.css.data.CSSConvertableValue;
	import org.osflash.html.element.HTMLNode;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class HTMLImgNode extends HTMLNode
	{
		
		/**
		 * @private
		 */
		private var _src : String;
		
		/**
		 * @private
		 */
		private var _alt : String;
		
		/**
		 * @private
		 */
		private var _width : CSSConvertableValue;
		
		/**
		 * @private
		 */
		private var _height : CSSConvertableValue;
		
		public function HTMLImgNode(	src : String, 
										alt : String = '', 
										width : * = null, 
										height : * = null
										)
		{
			super(HTMLNodeType.IMG);
			
			if(null == src) throw new ArgumentError('Src can not be null');
			if(src.length == 0) throw new ArgumentError('Src can not be empty');
			
			_src = src;
			_alt = alt;
			
			_width = new CSSConvertableValue();
			_width.value = width;
			
			_height = new CSSConvertableValue();
			_height.value = height;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const node : XML = super.write();
			
			node.@src = src;
			if(null != alt && alt.length > 0) node.@alt = alt;
			if(null != width) node.@width = width;
			if(null != height) node.@height = height;
			
			return node;
		}

		public function get src() : String { return _src; }
		public function set src(value : String) : void
		{
			if(null == value) throw new ArgumentError('Value can not be null');
			if(value.length == 0) throw new ArgumentError('Value can not be empty');
			
			_src = src;
		}

		public function get alt() : String { return _alt; }
		public function set alt(value : String) : void { _alt = value; }

		public function get width() : * { return _width.value; }
		public function set width(value : *) : void { _width.value = value; }

		public function get height() : * { return _height.value; }
		public function set height(value : *) : void	{ _height.value = value;	}
	}
}
