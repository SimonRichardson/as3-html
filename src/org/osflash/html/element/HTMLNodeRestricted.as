package org.osflash.html.element
{
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
		override public function get classes() : CSSClasses
		{
			throw new HTMLError(typeName.toUpperCase() + ' is not allowed to have css classes');
		}
		
		final public function get restricted() : Boolean { return true; }
	}
}
