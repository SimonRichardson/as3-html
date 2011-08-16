package org.osflash.css.classes
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class CSSClasses
	{
		
		/**
		 * @private
		 */
		private var _names : Vector.<String>;

		public function CSSClasses()
		{
			_names = new Vector.<String>();
		}
		
		public function add(name : String) : void
		{
			if(_names.indexOf(name) == -1) _names.push(name);
		}
		
		public function remove(name : String) : void
		{
			const index : int = _names.indexOf(name);
			if(index >= 0) _names.splice(index, 1);
		}
		
		public function contains(name : String) : Boolean
		{
			return _names.indexOf(name) >= 0;
		}
		
		public function read(xml : XML) : void
		{
			
		}
		
		public function write(xml : XML) : void
		{
			
		}
		
		public function get length() : int { return _names.length; }
	}
}
