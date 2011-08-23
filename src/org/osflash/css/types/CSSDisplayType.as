package org.osflash.css.types
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class CSSDisplayType
	{
		
		public static const NONE : CSSDisplayType = new CSSDisplayType('none');
		
		public static const BLOCK : CSSDisplayType = new CSSDisplayType('block');
		
		public static const INLINE : CSSDisplayType = new CSSDisplayType('inline');
		
		public static const INLINE_BLOCK : CSSDisplayType = new CSSDisplayType('inline-block');
		
		public static const INLINE_TABLE : CSSDisplayType = new CSSDisplayType('inline-table');
		
		public static const LIST_ITEM : CSSDisplayType = new CSSDisplayType('list-item');
		
		public static const RUN_IN : CSSDisplayType = new CSSDisplayType('run-in');
		
		public static const TABLE : CSSDisplayType = new CSSDisplayType('table');
		
		public static const TABLE_CAPTION : CSSDisplayType = new CSSDisplayType('table-caption');
		
		public static const TABLE_CELL : CSSDisplayType = new CSSDisplayType('table-cell');
		
		public static const TABLE_COLUMN : CSSDisplayType = new CSSDisplayType('table-column');
		
		public static const TABLE_COLUMN_GROUP : CSSDisplayType = 
														new CSSDisplayType('table-column-group');
														
		public static const TABLE_FOOTER_GROUP : CSSDisplayType = 
														new CSSDisplayType('table-footer-group');
		
		public static const TABLE_HEADER_GROUP : CSSDisplayType = 
														new CSSDisplayType('table-header-group');
		
		public static const TABLE_ROW : CSSDisplayType = new CSSDisplayType('table-row');
		
		public static const TABLE_ROW_GROUP : CSSDisplayType = 
														new CSSDisplayType('table-row-group');
		
		public static const INHERIT : CSSDisplayType = new CSSDisplayType('inherit');
		
		/**
		 * @private
		 */
		private var _type : String;

		/**
		 * @private
		 */
		private var _name : String;

		public function CSSDisplayType(type : String)
		{
			if(null == type) throw new ArgumentError('Type can not be null');
			if(type.length == 0) throw new ArgumentError('Type can not be empty');
			
			_type = type;
		}
		
		public static function typeAsString(type : CSSDisplayType) : String
		{
			switch(type)
			{
				case NONE:
				case BLOCK:
				case INLINE:
				case INLINE_BLOCK:
				case INLINE_TABLE:
				case LIST_ITEM:
				case RUN_IN:
				case TABLE:
				case TABLE_CAPTION:
				case TABLE_CELL:
				case TABLE_COLUMN:
				case TABLE_COLUMN_GROUP:
				case TABLE_FOOTER_GROUP:
				case TABLE_HEADER_GROUP:
				case TABLE_ROW:
				case TABLE_ROW_GROUP:
				case INHERIT:
					return type.type;
				default: 
					throw new ArgumentError('Unknown CSSDisplayType found');
			}
		}
		
		public function get name() : String
		{
			if(null == _name) _name = typeAsString(this);
			return _name; 
		}
  		
		public function get type() : String { return _type; }
	}
}
