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
		
		public function add(name : String) : CSSClasses
		{
			if(_names.indexOf(name) == -1) _names.push(name);
			
			return this;
		}
		
		public function remove(name : String) : CSSClasses
		{
			const index : int = _names.indexOf(name);
			if(index >= 0) _names.splice(index, 1);
			
			return this;
		}
		
		public function removeAll() : CSSClasses
		{
			_names.length = 0;
			
			return this;
		}
		
		public function contains(name : String) : Boolean
		{
			return _names.indexOf(name) >= 0;
		}
				
		public function write() : String
		{
			return _names.join(' ');
		}
		
		public function get length() : int { return _names.length; }
	}
}
