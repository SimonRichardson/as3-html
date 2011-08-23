package org.osflash.css.geom
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class CSSPadding extends CSSRectangle
	{
		
		
		public function CSSPadding(	top : * = null, 
									right : * = null, 
									bottom : * = null, 
									left : * = null
									)
		{
			this.top = top;
			this.right = right;
			this.bottom = bottom;
			this.left = left;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function write() : String
		{
			return 'padding: ' + 
								top + ' ' + 
								right + ' '  + 
								bottom + ' '  + 
								left + 
								';';
		}
	}
}
