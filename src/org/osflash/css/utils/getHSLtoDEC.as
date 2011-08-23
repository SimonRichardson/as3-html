package org.osflash.css.utils
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public function getHSLtoDEC(h : Number, s : Number, l : Number) : uint
	{
		if (l == 0) return 0;
		else if (s == 0) return getRGBtoDEC(l * 255, l * 255, l * 255);
		else
		{
			h = h / 360;

			const t2 : Number = (l <= 0.5) ? l * (1 + s) : l + s - (l * s);
			const t1 : Number = 2 * l - t2;
			
			const t3 : Vector.<Number> = new Vector.<Number>();
			t3.push(h + 1 / 3);
			t3.push(h);
			t3.push(h - 1 / 3);

			const clr : Vector.<Number> = new Vector.<Number>();
			clr.push(0);
			clr.push(0);
			clr.push(0);
						
			for (var i : int = 0;i < 3;i++)
			{
				if (t3[i] < 0) t3[i] += 1;
				if (t3[i] > 1) t3[i] -= 1;

				if (6 * t3[i] < 1) clr[i] = t1 + (t2 - t1) * t3[i] * 6;
				else if (2 * t3[i] < 1) clr[i] = t2;
				else if (3 * t3[i] < 2) clr[i] = (t1 + (t2 - t1) * ((2 / 3) - t3[i]) * 6);
				else clr[i] = t1;
			}
			
			return getRGBtoDEC(clr[0] * 255, clr[1] * 255, clr[2] * 255);
		}
	}
}
