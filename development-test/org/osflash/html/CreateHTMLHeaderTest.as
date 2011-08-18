package org.osflash.html
{
	import org.osflash.dom.element.utils.describeDOM;
	import org.osflash.html.builders.elements.body.HTMLBodyNode;
	import org.osflash.html.builders.elements.body.header.HTMLH1Node;
	import org.osflash.html.builders.elements.body.header.HTMLH2Node;
	import org.osflash.html.builders.elements.body.header.HTMLH3Node;
	import org.osflash.html.builders.elements.body.header.HTMLH4Node;
	import org.osflash.html.builders.elements.body.header.HTMLH5Node;
	import org.osflash.html.builders.elements.body.header.HTMLH6Node;
	import org.osflash.html.builders.elements.head.HTMLHeadNode;
	import org.osflash.html.builders.elements.head.HTMLTitleNode;
	import org.osflash.html.element.HTMLDocument;
	import org.osflash.logger.logs.info;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	[SWF(backgroundColor="#333333", frameRate="31", width="480", height="480")]
	public class CreateHTMLHeaderTest extends Sprite
	{

		public function CreateHTMLHeaderTest()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;

			XML.ignoreComments = false;

			const dom : HTMLDocument = new HTMLDocument();

			const head : HTMLHeadNode = new HTMLHeadNode();
			head.add(new HTMLTitleNode('HTML Test'));

			dom.add(head);
			
			const body : HTMLBodyNode = new HTMLBodyNode();
			body.add(new HTMLH1Node('This is a h1'));
			body.add(new HTMLH2Node('This is a h2'));
			body.add(new HTMLH3Node('This is a h3'));
			body.add(new HTMLH4Node('This is a h4'));
			body.add(new HTMLH5Node('This is a h5'));
			body.add(new HTMLH6Node('This is a h6'));
			
			dom.add(body);
			
			info(describeDOM(dom));
			info(dom.write());
		}
	}
}
