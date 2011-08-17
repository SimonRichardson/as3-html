package org.osflash.css.geom
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class CSSPadding extends CSSTRBL
	{
		
		
		public function CSSPadding(	top : * = 0, 
									right : * = 0, 
									bottom : * = 0, 
									left : * = 0
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
