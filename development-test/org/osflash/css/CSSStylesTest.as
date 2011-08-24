package org.osflash.css
{
	import org.osflash.css.properties.CSSBackgroundImage;
	import org.osflash.css.types.CSSBackgroundAttachmentType;
	import org.osflash.css.types.CSSBackgroundImageType;
	import org.osflash.css.types.CSSBackgroundRepeatType;
	import org.osflash.logger.logs.info;
	import org.osflash.stream.IStreamOutput;
	import org.osflash.stream.types.vector.StreamVectorOutput;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	[SWF(backgroundColor="#333333", frameRate="31", width="480", height="480")]
	public class CSSStylesTest extends Sprite
	{

		public function CSSStylesTest()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			const image0 : CSSBackgroundImage = new CSSBackgroundImage();
			image0.image = 'http://www.google.com/logo.png';
			image0.imageType = CSSBackgroundImageType.URL;
			image0.position = '10% 50%';
			image0.repeat = CSSBackgroundRepeatType.REPEAT;
			image0.attachment = CSSBackgroundAttachmentType.FIXED;
			
			const image1 : CSSBackgroundImage = new CSSBackgroundImage();
			image1.image = 'http://www.google.com/logo.png';
			image1.imageType = CSSBackgroundImageType.URL;
			image1.attachment = CSSBackgroundAttachmentType.SCROLL;
			
			const css : CSSStyles = new CSSStyles();
			
			const style0 : CSSStyle = css.addID('div0');
			style0.background.add(image0);
			style0.background.color = 'rgb(0, 255, 255)';
			style0.setPadding('10%', '20px');
			style0.setMargin('20px', '10%');
			
			const style1 : CSSStyle = css.addID('div1');
			style1.background.add(image1);
			style1.background.color = 'rgb(255, 0, 255)';
			style1.setPadding('50px', '100%');
			style1.setMargin('100px', '10px');
			
			const stream : IStreamOutput = new StreamVectorOutput();
			css.write(stream);
			info(stream.toString());
		}
	}
}
