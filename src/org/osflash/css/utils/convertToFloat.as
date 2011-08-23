package org.osflash.css.utils
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public function convertToFloat(value : String) : Number
	{
		return value.charCodeAt(value.length - 1) == '%'.charCodeAt(0) ? 
														parseInt(value) / 100 : 
														parseFloat(value);
	}
}