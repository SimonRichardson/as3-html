package org.osflash.html.builders.elements.meta
{
	import org.osflash.html.builders.types.HTMLEquivType;
	import org.osflash.html.element.HTMLNodeRestricted;
	import org.osflash.html.element.HTMLNodeType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLMetaEquivTypeNode extends HTMLNodeRestricted
	{
		
		
		/**
		 * @private
		 */
		private var _httpEquiv : HTMLEquivType;
		
		public function HTMLMetaEquivTypeNode(httpEquiv : HTMLEquivType)
		{
			super(HTMLNodeType.META);
			
			_httpEquiv = httpEquiv;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			const node : XML = super.write();
			
			node.@['http-equiv'] = httpEquiv.name;
			
			return node;
		}
		
		public function get httpEquiv() : HTMLEquivType { return _httpEquiv; }
		public function set httpEquiv(value : HTMLEquivType) : void { _httpEquiv = value; }
	}
}
