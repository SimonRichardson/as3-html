package org.osflash.html.builders.elements.body
{
	import org.osflash.html.builders.types.HTMLEncodeType;
	import org.osflash.html.builders.types.HTMLMethodType;
	import org.osflash.html.element.HTMLNodeContainer;
	import org.osflash.html.element.HTMLNodeType;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLFormNode extends HTMLNodeContainer
	{
		
		/**
		 * @private
		 */
		private var _action : String;
		
		/**
		 * @private
		 */
		private var _methodType : HTMLMethodType;
		
		/**
		 * @private
		 */
		private var _encodeType : HTMLEncodeType;
		
		public function HTMLFormNode(	action : String, 
										methodType : HTMLMethodType = null, 
										encodeType : HTMLEncodeType = null
										)
		{
			super(HTMLNodeType.FORM);
			
			if(null == action) throw new ArgumentError('Action can not be null');
			if(action.length == 0) throw new ArgumentError('Action can not be empty');
			
			_action = action;
			_methodType = methodType || HTMLMethodType.GET;
			_encodeType = encodeType || HTMLEncodeType.TEXT_PLAIN;
		}

		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const node : XML = super.write();
			
			node.@action = action;
			node.@method = methodType.name;
			if(null != encodeType) node.@encodeType = encodeType.name;
			
			return node;
		}

		public function get action() : String { return _action; }
		public function set action(value : String) : void
		{
			if(null == value) throw new ArgumentError('Value can not be null');
			if(value.length == 0) throw new ArgumentError('Value can not be empty');
			
			_action = value;
		}

		public function get methodType() : HTMLMethodType { return _methodType; }
		public function set methodType(value : HTMLMethodType) : void
		{
			if(null == value) throw new ArgumentError('Value can not be null');
			
			_methodType = value;
		}

		public function get encodeType() : HTMLEncodeType { return _encodeType; }
		public function set encodeType(value : HTMLEncodeType) : void { _encodeType = value; }
	}
}
