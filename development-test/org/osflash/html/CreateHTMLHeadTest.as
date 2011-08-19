package org.osflash.html
{
	import org.osflash.html.builders.elements.common.HTMLRawTextNode;
	import org.osflash.html.builders.elements.common.HTMLCDATANode;
	import org.osflash.css.CSSStyle;
	import org.osflash.css.CSSStyles;
	import org.osflash.dom.element.utils.describeDOM;
	import org.osflash.html.builders.elements.common.comments.HTMLCommentNode;
	import org.osflash.html.builders.elements.common.script.HTMLScriptFileNode;
	import org.osflash.html.builders.elements.common.script.HTMLScriptNode;
	import org.osflash.html.builders.elements.common.style.HTMLStyleNode;
	import org.osflash.html.builders.elements.head.HTMLBaseNode;
	import org.osflash.html.builders.elements.head.HTMLHeadNode;
	import org.osflash.html.builders.elements.head.HTMLLinkNode;
	import org.osflash.html.builders.elements.head.HTMLTitleNode;
	import org.osflash.html.builders.elements.head.meta.HTMLMetaCacheContentNode;
	import org.osflash.html.builders.elements.head.meta.HTMLMetaContentTypeNode;
	import org.osflash.html.builders.elements.head.meta.HTMLMetaDateNode;
	import org.osflash.html.builders.elements.head.meta.HTMLMetaLocationNode;
	import org.osflash.html.builders.elements.head.meta.HTMLMetaNameNode;
	import org.osflash.html.builders.elements.head.meta.HTMLMetaRefreshNode;
	import org.osflash.html.builders.elements.head.meta.HTMLMetaWindowTargetNode;
	import org.osflash.html.builders.types.meta.HTMLMetaCacheContentType;
	import org.osflash.html.builders.types.meta.HTMLMetaContentType;
	import org.osflash.html.element.HTMLDocument;
	import org.osflash.logger.logs.info;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	[SWF(backgroundColor="#333333", frameRate="31", width="480", height="480")]
	public class CreateHTMLHeadTest extends Sprite
	{

		public function CreateHTMLHeadTest()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;

			XML.ignoreComments = false;

			const dom : HTMLDocument = new HTMLDocument();

			const head : HTMLHeadNode = new HTMLHeadNode();
			head.autoMerge = true;
			
			head.add(new HTMLTitleNode('HTML Test'));

			head.add(new HTMLMetaCacheContentNode(HTMLMetaCacheContentType.NO_CACHE));
			head.add(new HTMLMetaContentTypeNode(HTMLMetaContentType.TEXT_HTML_UTF_8));
			head.add(new HTMLMetaDateNode(new Date()));
			head.add(new HTMLMetaLocationNode('http://www.hello.com'));
			head.add(new HTMLMetaRefreshNode(3000));
			head.add(new HTMLMetaWindowTargetNode('_top'));
			head.add(new HTMLMetaNameNode('keywords', 'some this goes here'));

			head.add(new HTMLBaseNode('http://www.hello.com'));
			head.add(new HTMLBaseNode(null, '_blank'));

			head.add(new HTMLLinkNode('http://www.hello.com/styles/global.css'));

			head.add(new HTMLCommentNode('Style starts here'));

			const css0 : CSSStyles = new CSSStyles();
			const style0 : CSSStyle = css0.addID('div1');
			style0.setPadding('10%', '20px');
			style0.setMargin('20px', '10%');

			const css1 : CSSStyles = new CSSStyles();
			const style1 : CSSStyle = css1.addElement('div');
			style1.setPadding('10%', '20px');
			style1.setMargin('20px', '10%');

			head.add(new HTMLStyleNode(css0));
			head.add(new HTMLStyleNode(css1));
			head.add(new HTMLCommentNode('Style finishes here'));

			head.add(new HTMLScriptFileNode('http://www.hello.com/script/global.js'));
			head.add(new HTMLScriptNode(new HTMLCDATANode('alert(\'Hello World 0\');')));
			head.add(new HTMLScriptNode(new HTMLRawTextNode('alert(\'Hello World 1\');')));

			dom.add(head);
			
			info(describeDOM(dom));
			info(dom.write());
			info(describeDOM(dom));
			info(dom.write());
		}
	}
}
