package org.osflash.html.element
{
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.css.classes.CSSClasses;
	import org.osflash.html.errors.HTMLError;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class HTMLNodeRestricted extends HTMLNode implements IHTMLNodeRestricted
	{

		public function HTMLNodeRestricted(type : HTMLNodeType)
		{
			super(type);
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function addAt(node : IDOMNode, index : int) : IDOMNode
		{
			throw new HTMLError('This HTMLNode can not have any children');
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function removeAt(index : int) : IDOMNode
		{
			throw new HTMLError('This HTMLNode can not have any children');
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function contains(node : IDOMNode) : Boolean
		{
			throw new HTMLError('This HTMLNode can not have any children');
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function getAt(index : int) : IDOMNode
		{
			throw new HTMLError('This HTMLNode can not have any children');
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function getIndex(node : IDOMNode) : int
		{
			throw new HTMLError('This HTMLNode can not have any children');
		}

		/**
		 * @inheritDoc
		 */
		override public function get classes() : CSSClasses
		{
			throw new HTMLError(typeName.toUpperCase() + ' is not allowed to have css classes');
		}
		
		final public function get restricted() : Boolean { return true; }
	}
}
