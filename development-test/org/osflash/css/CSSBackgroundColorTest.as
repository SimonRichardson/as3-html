package org.osflash.css
{
	import org.osflash.stream.types.vector.StreamVectorOutput;
	import org.osflash.stream.IStreamOutput;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import org.osflash.css.properties.CSSBackground;
	import org.osflash.css.properties.CSSBackgroundImage;
	import org.osflash.css.types.CSSBackgroundAttachmentType;
	import org.osflash.css.types.CSSBackgroundImageType;
	import org.osflash.css.types.CSSBackgroundRepeatType;
	import org.osflash.logger.logs.info;

	[SWF(backgroundColor="#333333", frameRate="31", width="480", height="480")]
	public class CSSBackgroundColorTest extends Sprite
	{

		public function CSSBackgroundColorTest()
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

			const background : CSSBackground = new CSSBackground();
			background.add(image0);
			background.add(image1);
			
			background.color = 'hsl(255, 50%, 10%)';
			
			const stream : IStreamOutput = new StreamVectorOutput();
			background.write(stream);
			
			info(stream.toString());
		}
	}
}
