package org.osflash.css
{
	import org.osflash.css.types.CSSStyleType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class CSSInlineStyle extends CSSStyle
	{

		public function CSSInlineStyle(name : String)
		{
			super(CSSStyleType.INLINE, name);
		}
	}
}
