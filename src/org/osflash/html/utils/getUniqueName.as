package org.osflash.html.utils
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public function getUniqueName() : String
	{
		_identifier++;
		
		return 'HTMLNode' + _identifier; 
	}
}

private static var _identifier : int = 0; 