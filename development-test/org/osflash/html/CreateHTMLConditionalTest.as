package org.osflash.html
{
	import org.osflash.html.builders.elements.common.HTMLRawTextNode;
	import org.osflash.html.builders.elements.body.HTMLDIVNode;
	import org.osflash.html.builders.types.HTMLConditionalType;
	import org.osflash.html.builders.elements.common.comments.HTMLConditionalNode;
	import org.osflash.dom.element.utils.describeDOM;
	import org.osflash.html.builders.elements.body.HTMLBodyNode;
	import org.osflash.html.builders.elements.head.HTMLHeadNode;
	import org.osflash.html.builders.elements.head.HTMLTitleNode;
	import org.osflash.html.element.HTMLDocument;
	import org.osflash.logger.logs.info;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	[SWF(backgroundColor="#333333", frameRate="31", width="480", height="480")]
	public class CreateHTMLConditionalTest extends Sprite
	{

		public function CreateHTMLConditionalTest()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;

			XML.ignoreComments = false;

			const dom : HTMLDocument = new HTMLDocument();

			const head : HTMLHeadNode = new HTMLHeadNode();
			head.add(new HTMLTitleNode('HTML Test'));

			dom.add(head);

			const body : HTMLBodyNode = new HTMLBodyNode();
			
			const ie : HTMLConditionalNode = new HTMLConditionalNode(HTMLConditionalType.IE);
			const ieDIV : HTMLDIVNode = new HTMLDIVNode();
			ieDIV.add(new HTMLRawTextNode('IE')); 
			ie.add(ieDIV);
			
			body.add(ie);
			
			const ie5 : HTMLConditionalNode = new HTMLConditionalNode(HTMLConditionalType.IE_5);
			const ie5DIV : HTMLDIVNode = new HTMLDIVNode();
			ie5DIV.add(new HTMLRawTextNode('IE 5')); 
			ie5.add(ie5DIV);
			
			body.add(ie5);
			
			const ie50 : HTMLConditionalNode = new HTMLConditionalNode(HTMLConditionalType.IE_5_0);
			const ie50DIV : HTMLDIVNode = new HTMLDIVNode();
			ie50DIV.add(new HTMLRawTextNode('IE 5.0')); 
			ie50.add(ie50DIV);
			
			body.add(ie50);
			
			const ie55 : HTMLConditionalNode = new HTMLConditionalNode(HTMLConditionalType.IE_5_5);
			const ie55DIV : HTMLDIVNode = new HTMLDIVNode();
			ie55DIV.add(new HTMLRawTextNode('IE 5.5')); 
			ie55.add(ie55DIV);
			
			body.add(ie55);
			
			const ie6 : HTMLConditionalNode = new HTMLConditionalNode(HTMLConditionalType.IE_6);
			const ie6DIV : HTMLDIVNode = new HTMLDIVNode();
			ie6DIV.add(new HTMLRawTextNode('IE 6')); 
			ie6.add(ie6DIV);
			
			body.add(ie6);
			
			const ie7 : HTMLConditionalNode = new HTMLConditionalNode(HTMLConditionalType.IE_7);
			const ie7DIV : HTMLDIVNode = new HTMLDIVNode();
			ie7DIV.add(new HTMLRawTextNode('IE 7')); 
			ie7.add(ie7DIV);
			
			body.add(ie7);
			
			const ie8 : HTMLConditionalNode = new HTMLConditionalNode(HTMLConditionalType.IE_8);
			const ie8DIV : HTMLDIVNode = new HTMLDIVNode();
			ie8DIV.add(new HTMLRawTextNode('IE 8')); 
			ie8.add(ie8DIV);
			
			body.add(ie8);
			
			dom.add(body);

			info(describeDOM(dom));
			info(dom.write());
		}
	}
}
