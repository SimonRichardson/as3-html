package org.osflash.html
{
	import org.osflash.css.CSSStyle;
	import org.osflash.css.CSSStyles;
	import org.osflash.html.builders.elements.HTMLBodyNode;
	import org.osflash.html.builders.elements.HTMLCommentNode;
	import org.osflash.html.builders.elements.HTMLDivNode;
	import org.osflash.html.builders.elements.HTMLH1Node;
	import org.osflash.html.builders.elements.HTMLHeadNode;
	import org.osflash.html.builders.elements.HTMLLinkNode;
	import org.osflash.html.builders.elements.HTMLStyleNode;
	import org.osflash.html.builders.elements.HTMLTitleNode;
	import org.osflash.html.element.HTMLDocument;
	import org.osflash.logger.logs.info;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	
	[SWF(backgroundColor="#333333", frameRate="31", width="480", height="480")]
	public class CreateHTMLTest extends Sprite
	{

		public function CreateHTMLTest()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			XML.ignoreComments = false;
			
			const dom : HTMLDocument = new HTMLDocument();
			
			const head : HTMLHeadNode = new HTMLHeadNode();
			head.add(new HTMLTitleNode('HTML Test'));
			head.add(new HTMLLinkNode('http://www.hello.com/styles/global.css'));
			
			const css : CSSStyles = new CSSStyles(true);
			const style0 : CSSStyle = css.addID('div1');
			style0.setPadding('10%', '20px');
			style0.setMargin('20px', '10%');
			
			const style1 : CSSStyle = css.addElement('div');
			style1.setPadding('10%', '20px');
			style1.setMargin('20px', '10%');
			
			head.add(new HTMLStyleNode(css));
			dom.add(head);
			
			dom.add(new HTMLCommentNode('This is a comment'));
			
			const body : HTMLBodyNode = new HTMLBodyNode();
			const h1 : HTMLH1Node = new HTMLH1Node('HTML Test');
			body.add(h1);
			
			const div : HTMLDivNode = new HTMLDivNode();
			div.id = 'div1';
			div.classes.add('wrapper').add('slapper');
			
			body.add(div);
			dom.add(body);
			
			// info(describeDOM(html));
			// info(html.select('//*.(@id=="div1")'));
			info(dom.write());
		}
	}
}
