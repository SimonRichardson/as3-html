package org.osflash.css
{
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

			const image : CSSBackgroundImage = new CSSBackgroundImage();
			image.image = 'http://www.google.com/logo.png';
			image.imageType = CSSBackgroundImageType.URL;
			image.position = '10% 50%';
			image.repeat = CSSBackgroundRepeatType.REPEAT;
			image.attachment = CSSBackgroundAttachmentType.FIXED;

			const background : CSSBackground = new CSSBackground();
			background.add(image);
			
			background.color = 'hsl(255, 50%, 10%)';
			
			info(background.write());
		}
	}
}
