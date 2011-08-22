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
		
		/**
		 * @inheritDoc
		 */
		override public function write() : String
		{
			const buffer : Vector.<String> = new Vector.<String>();
			
			if(null != padding) buffer.push(padding.write());
			if(null != margin) buffer.push(margin.write());
						
			return buffer.join(' ');
		}
	}
}
