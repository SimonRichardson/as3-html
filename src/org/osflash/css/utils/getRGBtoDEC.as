package org.osflash.css.utils
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public function getRGBtoDEC(r : int, g : int, b : int) : uint
	{
		return (r << 16) | (g << 8) | b;
	}
}
