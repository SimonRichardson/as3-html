package org.osflash.html
{
	import org.osflash.dom.element.utils.describeDOM;
	import org.osflash.html.builders.elements.body.HTMLBodyNode;
	import org.osflash.html.builders.elements.head.HTMLHeadNode;
	import org.osflash.html.builders.elements.head.HTMLTitleNode;
	import org.osflash.html.element.HTMLDocument;
	import org.osflash.logger.logs.info;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	[SWF(backgroundColor="#333333", frameRate="31", width="480", height="480")]
	public class CreateHTMLBodyTest extends Sprite
	{

		public function CreateHTMLBodyTest()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;

			XML.ignoreComments = false;

			const dom : HTMLDocument = new HTMLDocument();

			const head : HTMLHeadNode = new HTMLHeadNode();
			head.add(new HTMLTitleNode('HTML Test'));

			dom.add(head);

			const body : HTMLBodyNode = new HTMLBodyNode();
			dom.add(body);

			info(describeDOM(dom));
			info(dom.write());
		}
	}
}
