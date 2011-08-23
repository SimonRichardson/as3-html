package org.osflash.css.utils
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public function getDECtoHEX(value : uint) : String
	{
		var hex : String = value.toString(16);
		
		// Pad it out!
		const minimumLength : int = value > int.MAX_VALUE ? 8 : 6;
		while (minimumLength > hex.length)
		{
			hex = "0" + hex;
		}
		
		return '#' + hex;
	}
}
