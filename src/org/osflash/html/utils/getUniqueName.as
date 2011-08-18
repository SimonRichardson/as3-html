package org.osflash.html.utils
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public function getUniqueName() : String
	{
		return 'HTMLNode' + uniqueNameCounter++; 
	}
}

// This is a private value, that is actually global.
var uniqueNameCounter : int = 0;