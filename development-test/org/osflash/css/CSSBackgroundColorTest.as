package org.osflash.css
{
	import org.osflash.css.data.CSSBackground;
	import org.osflash.logger.logs.info;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	[SWF(backgroundColor="#333333", frameRate="31", width="480", height="480")]
	public class CSSBackgroundColorTest extends Sprite
	{

		public function CSSBackgroundColorTest()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;

			const background : CSSBackground = new CSSBackground();
			background.color = 'rgba(255, 0, 255, .5)';
			
			info(background.color);
		}
	}
}
