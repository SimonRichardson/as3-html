package org.osflash.css.geom
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class CSSMargin extends CSSRectangle
	{
		
		
		public function CSSMargin(	top : * = null, 
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
			return 'margin: ' + 
								top + ' ' + 
								right + ' '  + 
								bottom + ' '  + 
								left + 
								';';
		}
	}
}
