//========================================================================================
//  $File: //a3t/argon/branches/v1/1.0/dev/sdk/samples/flex/textLayout_ui/src/bxf/ui/controls/ConflictOverlay.as $
//  $DateTime: 2009/12/22 14:38:02 $
//  $Revision: #1 $
//  $Change: 733743 $
//
//  ADOBE CONFIDENTIAL
//
//  Copyright 2008 Adobe Systems Incorporated. All rights reserved.
//
//  NOTICE:  All information contained herein is, and remains
//  the property of Adobe Systems Incorporated and its suppliers,
//  if any.  The intellectual and technical concepts contained
//  herein are proprietary to Adobe Systems Incorporated and its
//  suppliers and may be covered by U.S. and Foreign Patents,
//  patents in process, and are protected by trade secret or copyright law.
//  Dissemination of this information or reproduction of this material
//  is strictly forbidden unless prior written permission is obtained
//  from Adobe Systems Incorporated.
//
//========================================================================================

package com.adobe.bxf.ui.controls
{
	import mx.containers.Canvas;

	public class ConflictOverlay extends Canvas
	{
		public function ConflictOverlay()
		{
			super();
		}

		protected override function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);

			graphics.clear();
			graphics.lineStyle(1, 0xffffff, 1.0, true);
			graphics.moveTo(1, unscaledHeight / 2 - 1);
			graphics.lineTo(unscaledWidth - 2, unscaledHeight / 2 - 1);
			graphics.lineStyle(1, 0x000000, 1.0, true);
			graphics.moveTo(1, unscaledHeight / 2);
			graphics.lineTo(unscaledWidth - 2, unscaledHeight / 2);
		}
	}
}