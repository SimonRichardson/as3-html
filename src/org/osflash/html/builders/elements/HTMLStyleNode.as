package org.osflash.html.builders.elements
{
	import org.osflash.html.element.IHTMLNodeRestricted;
	import org.osflash.css.CSSStyle;
	import org.osflash.css.CSSStyles;
	import org.osflash.css.css_namespace;
	import org.osflash.css.types.CSSStyleType;
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.dom.element.utils.getAllDOMElementChildren;
	import org.osflash.html.builders.types.HTMLMIMEType;
	import org.osflash.html.builders.types.HTMLMediaType;
	import org.osflash.html.element.HTMLNode;
	import org.osflash.html.element.HTMLNodeRestrictedContainer;
	import org.osflash.html.element.HTMLNodeType;
	import org.osflash.html.errors.HTMLError;


	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class HTMLStyleNode extends HTMLNodeRestrictedContainer
	{
		
		use namespace css_namespace;
		
		/**
		 * @private
		 */
		private var _styles : CSSStyles;
		
		/**
		 * @private
		 */
		private var _mimeType : HTMLMIMEType;
		
		/**
		 * @private
		 */
		private var _mediaType : HTMLMediaType;
		
		public function HTMLStyleNode(	styles : CSSStyles, 
										type : HTMLMIMEType = null, 
										media : HTMLMediaType = null
										)
		{
			super(HTMLNodeType.STYLE);
			
			if(null == styles) throw new ArgumentError('Styles can not be null');
			
			_styles = styles;
			
			_mimeType = type || HTMLMIMEType.TEXT_CSS;
			_mediaType = media;
		}

		/**
		 * @inheritDoc
		 */
		override public function write() : XML
		{
			const xml : XML = super.write();
			
			xml.@type = _mimeType.name;
			
			if(null != _mediaType) xml.@media = _mediaType.name;
			
			if(styles.strict)
			{
				const items : Vector.<CSSStyle> = styles.styles;
				
				var index : int = items.length;
				if(index > 0)
				{
					const nodes : Vector.<IDOMNode> = getAllDOMElementChildren(document);
					
					while(--index > -1)
					{
						const style : CSSStyle = items[index];
						
						var valid : Boolean = false;
						
						const total : int = nodes.length;
						for(var i : int = 0; i<total; i++)
						{
							const node : IDOMNode = nodes[i];
							if(node is HTMLNode)
							{
								const htmlNode : HTMLNode = HTMLNode(node);
								if(style.type == CSSStyleType.ID)
								{
									if(htmlNode.id == style.name)
									{
										valid = true;
										break;	
									}
								}
								else if(style.type == CSSStyleType.ELEMENT)
								{
									if(htmlNode.typeName == style.name)
									{
										valid = true;
										break;
									}
								}
								else if(style.type == CSSStyleType.CLASS)
								{
									if(!(htmlNode is IHTMLNodeRestricted))
									{
										if(htmlNode.classes.contains(style.name))
										{
											valid = true;
											break;
										}
									}
								}
								else throw new HTMLError('Invalid CSS selector found.');
							}
							else throw new HTMLError('Invalid HTMLNode found.');
						}
						
						if(!valid) throw new HTMLError('No such ' + style.type.name + ' found ' +
															'with CSS style of name ' + style.name);
					}
				}
			}
			
			const content : String = styles.write();
			xml.appendChild(content);
			
			return xml;
		}
		
		public function get styles() : CSSStyles { return _styles; }
		
		public function get mimeType() : HTMLMIMEType { return _mimeType; }
		
		public function get mediaType() : HTMLMediaType { return _mediaType; } 
	}
}
