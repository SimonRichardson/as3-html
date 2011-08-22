package org.osflash.html.builders.elements.body
{
	import org.osflash.html.builders.elements.common.HTMLTextNode;
	import org.osflash.html.element.HTMLNodeType;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class HTMLAcronymNode extends HTMLTextNode
	{

		public function HTMLAcronymNode(text : String, title : String)
		{
			super(HTMLNodeType.ACRONYM, text);

			if (null == text) throw new ArgumentError('Text can not be null');
			if (text.length == 0) throw new ArgumentError('Text can not be empty');
			if (null == title) throw new ArgumentError('Title can not be null');
			if (title.length == 0) throw new ArgumentError('Title can not be empty');

			this.title = title;
		}

		/**
		 * @inheritDoc
		 */
		override public function set title(value : String) : void
		{
			if (null == value) throw new ArgumentError('Value can not be null');
			if (value.length == 0) throw new ArgumentError('Value can not be empty');

			super.title = value;
		}
	}
}
