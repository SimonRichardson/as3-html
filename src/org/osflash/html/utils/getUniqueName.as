package org.osflash.html.utils
{
	import flash.utils.getTimer;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public function getUniqueName() : String
	{
		return 'HTMLNode' + (getTimer() * int(Math.random() * 10000)); 
	}
}