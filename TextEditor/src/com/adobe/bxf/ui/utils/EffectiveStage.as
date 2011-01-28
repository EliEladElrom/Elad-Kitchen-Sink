//========================================================================================
//  $File: //a3t/argon/branches/v1/1.0/dev/sdk/samples/flex/textLayout_ui/src/bxf/ui/utils/EffectiveStage.as $
//  $DateTime: 2009/12/22 14:38:02 $
//  $Revision: #1 $
//  $Change: 733743 $
//
//  ADOBE CONFIDENTIAL
//
//  Copyright 2007-08 Adobe Systems Incorporated. All rights reserved.
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
package com.adobe.bxf.ui.utils
{
	import flash.display.DisplayObject;

	/**
	 * Finds the effective stage to be used.  Assumes all DisplayObjects share the same stage so once calculated keep using it.
	 */

	public function EffectiveStage(obj:DisplayObject):DisplayObject
	{
		// safe to test for stage existence
		if (_effectiveStage == null && obj && obj.stage)
		{
			// if the stage is accessible lets use it.
			try
			{
				var x:int = obj.stage.numChildren;
				_effectiveStage = obj.stage;
			}
			catch(e:Error)
			{
				// TODO: some way to find the highest level accessible root???
				_effectiveStage = obj.root;
			}
		}
		return _effectiveStage;
	}

}

import flash.display.DisplayObject;
var _effectiveStage:DisplayObject = null;
