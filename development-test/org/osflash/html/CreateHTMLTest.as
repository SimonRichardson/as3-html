package org.osflash.html
{
	import org.osflash.css.CSSStyles;
	import org.osflash.html.builders.elements.HTMLBodyNode;
	import org.osflash.html.builders.elements.HTMLCommentNode;
	import org.osflash.html.builders.elements.HTMLDivNode;
	import org.osflash.html.builders.elements.HTMLHeadNode;
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
			
			const html : HTMLDocument = new HTMLDocument();
			
			const head : HTMLHeadNode = new HTMLHeadNode();
			head.add(new HTMLTitleNode('HTML Test'));
			
			const css : CSSStyles = new CSSStyles(true);
			css.addID('div1').setPadding(0, 0, 0, 0);
			
			head.add(new HTMLStyleNode(css));
			html.add(head);
			
			html.add(new HTMLCommentNode('This is a comment'));
			
			const body : HTMLBodyNode = new HTMLBodyNode();
			const div : HTMLDivNode = new HTMLDivNode();
			div.id = 'div1';
			div.classes.add('wrapper').add('slapper');
			
			body.add(div);
			html.add(body);
			
			// info(describeDOM(html));
			// info(html.select('//*.(@id=="div1")'));
			info(html.write());
		}
	}
}
