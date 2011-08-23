package org.osflash.css.utils
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public function getRGBAtoDEC(r : int, g : int, b : int, a : Number) : uint
	{
		return ((a * 255) << 24) | (r << 16) | (g << 8) | b;
	}
}
