package org.osflash.css.geom
{
	import org.osflash.stream.IStreamOutput;
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
		override public function write(stream : IStreamOutput) : void
		{
			stream.writeUTF('padding: ' + top + ' ' + right + ' ' + bottom + ' '  + left + ';');
		}
	}
}
