package org.osflash.css.data
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public interface ICSSValueConverter
	{
		
		function convert(value : *) : Number;
		
		function get relative() : Boolean;
	}
}
