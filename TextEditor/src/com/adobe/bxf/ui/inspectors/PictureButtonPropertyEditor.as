//========================================================================================
//  $File: //a3t/argon/branches/v1/1.0/dev/sdk/samples/flex/textLayout_ui/src/bxf/ui/inspectors/PictureButtonPropertyEditor.as $
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
package com.adobe.bxf.ui.inspectors
{
	import flash.events.MouseEvent;
	import flash.external.*;
	//import ControllerInterface.ExternalInterfaceConstants;

	import mx.controls.Button;

	public class PictureButtonPropertyEditor extends PropertyEditorBase implements IPropertyEditor
	{
		private var mButton:Button;
		private var mStyle:String;
		private var mTooltip:String;
		private var mCmd:int;

		public function PictureButtonPropertyEditor(inCmd:int, inStyle:String, inTooltip:String)
		{
			// style specifies all skins!
			// inCmd is cmd to send when clicked
			super("");
			mStyle = inStyle;
			mCmd = inCmd;
			mTooltip = inTooltip;
		}

		override protected function createChildren():void
		{
			super.createChildren();
			if (mButton == null) {
				mButton = new Button();

				if (mStyle != "")
				{
					mButton.styleName = mStyle;
				}
				addChild(mButton);
				if (mTooltip != "") {
					mButton.toolTip = mTooltip;
				}
				mButton.addEventListener( flash.events.MouseEvent.CLICK, onMouseClick);
			}
		}

		private function onMouseClick (mouseEvent: flash.events.MouseEvent):void {
		// sent event to host app -- this should really send command for flex app too, but can't figure out how to get toolbar controller
		// to just send command for flex app
			trace("send command: ", mCmd);
			//ExternalInterface.call(ExternalInterfaceConstants.cExecuteCommand, mCmd);
 		}


		public function setValueAsString(inValue:String, inProperty:String):void {
			// do nothing for this
		}


		public function setMultiValue(inValues:Array, inProperty:String):void {
			trace(this.className + ": Multivalue not supported yet.");
			setValueAsString(inValues[0], inProperty);
		}
	}
}