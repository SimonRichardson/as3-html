package org.osflash.html.builders.elements.head
{
	import org.osflash.css.CSSStyles;
	import org.osflash.css.errors.CSSError;
	import org.osflash.dom.dom_namespace;
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.html.builders.elements.common.HTMLRawTextNode;
	import org.osflash.html.builders.elements.common.script.HTMLScriptFileNode;
	import org.osflash.html.builders.elements.common.script.HTMLScriptNode;
	import org.osflash.html.builders.elements.common.style.HTMLStyleNode;
	import org.osflash.html.element.HTMLDocument;
	import org.osflash.html.element.HTMLNode;
	import org.osflash.html.element.HTMLNodeContainer;
	import org.osflash.html.element.HTMLNodeType;
	import org.osflash.html.errors.HTMLError;

	import flash.utils.Dictionary;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class HTMLHeadNode extends HTMLNodeContainer
	{
		
		/**
		 * @private
		 */
		private var _autoMerge : Boolean;
		
		public function HTMLHeadNode(autoMerge : Boolean = false)
		{
			super(HTMLNodeType.HEAD);
			
			_autoMerge = autoMerge;
			
			validNodeTypes.push(	HTMLNodeType.BASE,
									HTMLNodeType.LINK,
									HTMLNodeType.META,
									HTMLNodeType.SCRIPT,
									HTMLNodeType.STYLE,
									HTMLNodeType.TITLE
									);
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
			
			if(node.type == HTMLNodeType.TITLE)
			{
				if(containsType(node.type)) 
					throw new HTMLError('You can not add ' + htmlNode.typeName + ' again');
				else return super.addAt(node, index);
			}
			
			return super.addAt(node, index);
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function write() : XML
		{
			if(autoMerge) 
			{
				if(null == document) throw new HTMLError('No document found.');
				if(document is HTMLDocument)
				{
					use namespace dom_namespace;
					
					const htmlDocument : HTMLDocument = HTMLDocument(document);
					const elements : Vector.<IDOMNode> = htmlDocument.children;
					const total : int = elements.length;
					for(var i : int = 0; i < total; i++)
					{
						const node : IDOMNode = elements[i];
						if(node is HTMLNode)
						{
							if(node is HTMLHeadNode)
							{
								const head : HTMLHeadNode = HTMLHeadNode(node);
								const headChildren : Vector.<IDOMNode> = head.children.slice();
								
								merge(head);
								
								head.autoMerge = false;
								const output : XML = head.write();
								
								head.removeAll();
								
								const numChildren : int = headChildren.length;
								for(var j : int = 0; j < numChildren; j++)
								{
									const headChild : IDOMNode = headChildren[j];
									head.add(headChild);
								}
								
								head.autoMerge = true;
								
								return output;
							}
						}
						else throw new HTMLError('Unknown node type');
					}
					
					throw new HTMLError('No HTMLHeadNode found');					
				}
				else throw new HTMLError('Unknown document node type');
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
		public function merge(head : HTMLHeadNode = null) : void
		{
			if(null == document) throw new HTMLError('No document found.');
			
			mergeTags(head || this, HTMLNodeType.STYLE);
			mergeTags(head || this, HTMLNodeType.SCRIPT);
		}
		
		public function hasConditionalStatements() : Boolean
		{
			const typeName : String = HTMLNodeType.CONDITIONAL.name;
			const query : String = path.toQuery() + '/*.(@typeName=="' + typeName + '")';
			const nodes : Vector.<IDOMNode> = document.select(query);
			return (null != nodes && nodes.length > 0);
		}
		
		/**
		 * @private
		 * @param type HTMLNodeType of node to merge
		 */
		private function mergeTags(head : HTMLHeadNode, type : HTMLNodeType) : void
		{
			if(hasConditionalStatements())
				throw new HTMLError('Unable to merge tags, there are conditional if statements.');
			
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
								merge.push(mergeScriptNode.src.text);
								
								if(null == mergedNode) 
									mergedNode = new HTMLScriptNode(new HTMLRawTextNode(''));
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
								head.remove(removeStyle);
							}
							
							head.add(mergedStyleNode);
						}
						else if(mergedNode is HTMLScriptNode)
						{
							const mergedScriptNode : HTMLScriptNode = HTMLScriptNode(mergedNode);
							
							const numScripts : int = merge.length;
							for(k = 0; k<numScripts; k++)
							{
								mergedScriptNode.src.text += merge[k];
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
								head.remove(removeScript);
							}
							
							head.add(mergedScriptNode);
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
