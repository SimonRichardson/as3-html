package org.osflash.css
{
	import org.osflash.css.errors.CSSError;
	import org.osflash.css.types.CSSStyleType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class CSSStyles
	{
	
		/**
		 * @private
		 */
		private var _strict : Boolean;
		
		/**
		 * @private
		 */
		private var _styles : Vector.<CSSStyle>;

		public function CSSStyles(strict : Boolean = false)
		{
			_strict = strict;
			_styles = new Vector.<CSSStyle>();
		}
		
		public function addID(name : String) : CSSStyle
		{
			return add(CSSStyleType.ID, name);
		}
		
		public function removeID(name : String) : CSSStyle
		{
			return remove(CSSStyleType.ID, name);
		}
		
		public function addElement(name : String) : CSSStyle
		{
			return add(CSSStyleType.ELEMENT, name);
		}
		
		public function removeElement(name : String) : CSSStyle
		{
			return remove(CSSStyleType.ELEMENT, name);
		}
		
		public function addClass(name: String) : CSSStyle
		{
			return add(CSSStyleType.CLASS, name);
		}
		
		public function removeClass(name : String) : CSSStyle
		{
			return remove(CSSStyleType.CLASS, name);
		}
		
		public function add(type : CSSStyleType, name : String) : CSSStyle
		{
			if(contains(type, name)) throw new CSSError('Style already exists');
			
			const style : CSSStyle = new CSSStyle(type, name);
			
			_styles.push(style);
			
			return style;
		}

		public function remove(type : CSSStyleType, name : String) : CSSStyle
		{
			const index : int = find(type, name);
			if(index == -1) throw new CSSError('No such style exists');
			
			const result : Vector.<CSSStyle> = _styles.splice(index, 1);
			if(null == result) throw new CSSError('Invalid removal');
			if(result.length != 1) throw new CSSError('Removal mismatch');
			
			return result[0];
		}
		
		public function contains(type : CSSStyleType, name : String) : Boolean
		{
			var index : int = _styles.length;
			while(--index > -1)
			{
				const style : CSSStyle = _styles[index];
				if(style.type == type && style.name == name) return true;
			}
						
			return false;
		}
		
		public function find(type : CSSStyleType, name : String) : int
		{
			var index : int = _styles.length;
			while(--index > -1)
			{
				const style : CSSStyle = _styles[index];
				if(style.type == type && style.name == name) return index;
			}
						
			return -1;
		}
		
		public function getStyle(type : CSSStyleType, name : String) : CSSStyle
		{
			const index : int = find(type, name);
			if(index == -1) throw new CSSError('No such style exists');
			
			return _styles[index];
		}
		
		public function write() : String
		{
			const total : int = _styles.length;
			
			const buffer : Vector.<String> = new Vector.<String>();
			
			for(var i : int = 0; i < total; i++)
			{
				const style : CSSStyle = _styles[i];
				
				buffer.push(style.write());
			}
			
			return buffer.join('');
		}
		
		public function get strict() : Boolean { return _strict; }
		public function set strict(value : Boolean) : void { _strict = value; }
		
		css_namespace function get styles() : Vector.<CSSStyle> { return _styles; } 
	}
}
