package org.osflash.html.builders.elements.head
{
	import org.osflash.css.CSSStyles;
	import org.osflash.css.errors.CSSError;
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.html.builders.elements.common.script.HTMLScriptFileNode;
	import org.osflash.html.builders.elements.common.script.HTMLScriptNode;
	import org.osflash.html.builders.elements.common.style.HTMLStyleNode;
	import org.osflash.html.element.HTMLNode;
	import org.osflash.html.element.HTMLNodeRestrictedContainer;
	import org.osflash.html.element.HTMLNodeType;
	import org.osflash.html.errors.HTMLError;

	import flash.utils.Dictionary;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class HTMLHeadNode extends HTMLNodeRestrictedContainer
	{
		
		/**
		 * @private
		 */
		private var _autoMerge : Boolean;
		
		public function HTMLHeadNode(autoMerge : Boolean = false)
		{
			super(HTMLNodeType.HEAD);
			
			_autoMerge = autoMerge;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function addAt(node : IDOMNode, index : int) : IDOMNode
		{
			var htmlNode : HTMLNode;
			if(node is HTMLNode)
				htmlNode = HTMLNode(node);
			else throw new HTMLError('You can not add a none HTMLNode to HTMLNode');
			
			switch(node.type.type)
			{
				case HTMLNodeType.BASE.type:
				case HTMLNodeType.COMMENT.type:
				case HTMLNodeType.LINK.type:
				case HTMLNodeType.META.type:
				case HTMLNodeType.SCRIPT.type:
				case HTMLNodeType.STYLE.type:
					return super.addAt(node, index);
				case HTMLNodeType.TITLE.type:
					if(containsType(node.type)) 
						throw new HTMLError('You can not add ' + htmlNode.typeName + ' again');
					else return super.addAt(node, index);
				default:
					throw new HTMLError('You can not add ' + htmlNode.typeName + ' to ' + typeName);
					
			}
			
			return null;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			if(autoMerge) 
			{
				// TODO : Make this non-destructive!
				merge();
				return super.write();
			}
			else return super.write();
		}
		
		/**
		 * This traverses through the head tag and works out if some tags can be merged, this
		 * is to help with redundances and duplication of code. You see this a lot concerning
		 * WYSIWYG editors. The current issue with the merge is that it removes all items from the
		 * dom found withing the merge, so if there are references to items before the merge will
		 * no longer be in the dom.
		 * 
		 * @return void
		 */
		public function merge() : void
		{
			mergeTags(HTMLNodeType.STYLE);
			mergeTags(HTMLNodeType.SCRIPT);
		}
		
		/**
		 * @private
		 * @param type HTMLNodeType of node to merge
		 */
		private function mergeTags(type : HTMLNodeType) : void
		{
			// TODO: workout if an item is inside a IE comment node. If so prevent the merge
			// from happening, stating that there are rules which prevent this.
			
			const query : String = path.toQuery() + '/*.(@typeName=="' + type.name + '")';
			const nodes : Vector.<IDOMNode> = document.select(query);
			const total : int = nodes.length;
			if(total > 1)
			{
				const stack : Dictionary = new Dictionary();
				
				var hash : String;
				// Validate them and make sure that the types have the right metadata
				for(var i : int = 0; i<total; i++)
				{
					const node : IDOMNode = nodes[i];
					
					if(node.type == type)
					{
						if(node is HTMLStyleNode)
						{
							const styleNode : HTMLStyleNode = HTMLStyleNode(node);
							
							hash = styleNode.mimeType.name + 
									(null != styleNode.mediaType ? styleNode.mediaType.name : '');
							
							var styleNodes : Vector.<HTMLNode>;
							if(null == stack[hash]) 
							{
								styleNodes = new Vector.<HTMLNode>();
								stack[hash] = styleNodes;
							}
							else styleNodes = stack[hash];
							
							styleNodes.push(styleNode);
						}
						else if(node is HTMLScriptNode)
						{
							const scriptNode : HTMLScriptNode = HTMLScriptNode(node);
							
							hash = scriptNode.mimeType.name + 
									(null != scriptNode.charset ? scriptNode.charset.name : '');
							
							var scriptNodes : Vector.<HTMLNode>;
							if(null == stack[hash]) 
							{
								scriptNodes = new Vector.<HTMLNode>();
								stack[hash] = scriptNodes;
							}
							else scriptNodes = stack[hash];
							
							scriptNodes.push(scriptNode);
						}
						else if(node is HTMLScriptFileNode)
						{
							// We can't merge a script file.
							continue;
						}
						else throw new HTMLError('Invalid node found');
					}
					else throw new HTMLError('Invalid node type found');
				}
				
				// We have the same node types now, go through and scrap the content.
				for each(var mergeNodes : Vector.<HTMLNode> in stack)
				{
					const numNodes : int = mergeNodes.length;
					if(numNodes > 1)
					{
						var mergedNode : HTMLNode;
						
						const merge : Array = new Array();				
						for(var j : int = 0; j<numNodes; j++)
						{
							const mergeNode : HTMLNode = mergeNodes[j];
							if(mergeNode is HTMLStyleNode)
							{
								const mergeStyleNode : HTMLStyleNode = HTMLStyleNode(mergeNode);
								merge.push(mergeStyleNode.styles);
								
								if(null == mergedNode) 
									mergedNode = new HTMLStyleNode(new CSSStyles());
								else
								{
									if(!(mergedNode is HTMLStyleNode)) 
										throw new HTMLError('Merge node mix match');
								}
							}
							else if(mergeNode is HTMLScriptNode)
							{
								const mergeScriptNode : HTMLScriptNode = HTMLScriptNode(mergeNode);
								merge.push(mergeScriptNode.src);
								
								if(null == mergedNode) 
									mergedNode = new HTMLScriptNode('');
								else
								{
									if(!(mergedNode is HTMLScriptNode)) 
										throw new HTMLError('Merge node mix match');
								}
							}
							else throw new HTMLError('Invalid node found');
						}
						
						var k : int;
						var index : int;
						if(mergedNode is HTMLStyleNode)
						{
							const mergedStyleNode : HTMLStyleNode = HTMLStyleNode(mergedNode);
							
							const numStyles : int = merge.length;
							for(k = 0; k<numStyles; k++)
							{
								const cssStyle : CSSStyles = merge[k];
								try
								{
									mergedStyleNode.styles.concat(cssStyle);
								}
								catch(error : CSSError)
								{
									throw new HTMLError('Merge failed: ' + error.message);
								}
							}
							
							index = numNodes;
							while(--index > -1)
							{
								const removeStyle : HTMLStyleNode = 
																HTMLStyleNode(mergeNodes[index]);
								if(null != removeStyle.mimeType) 
									mergedStyleNode.mimeType = removeStyle.mimeType;
								if(null != removeStyle.mediaType) 
									mergedStyleNode.mediaType = removeStyle.mediaType;
								remove(removeStyle);
							}
							
							add(mergedStyleNode);
						}
						else if(mergedNode is HTMLScriptNode)
						{
							const mergedScriptNode : HTMLScriptNode = HTMLScriptNode(mergedNode);
							
							const numScripts : int = merge.length;
							for(k = 0; k<numScripts; k++)
							{
								mergedScriptNode.src += merge[k];
							}
							
							index = numNodes;
							while(--index > -1)
							{
								const removeScript : HTMLScriptNode = 
																HTMLScriptNode(mergeNodes[index]);
								if(null != removeScript.mimeType) 
									mergedScriptNode.mimeType = removeScript.mimeType;
								if(null != removeScript.charset) 
									mergedScriptNode.charset = removeScript.charset;
								remove(removeScript);
							}
							
							add(mergedScriptNode);
						}
						else throw new HTMLError('Invalid node found');
					}
				}
			}
		}
		
		public function get autoMerge() : Boolean { return _autoMerge; }
		public function set autoMerge(value : Boolean) : void { _autoMerge = value; }
	}
}
