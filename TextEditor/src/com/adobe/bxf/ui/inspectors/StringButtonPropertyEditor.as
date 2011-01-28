//========================================================================================
//  $File: //a3t/argon/branches/v1/1.0/dev/sdk/samples/flex/textLayout_ui/src/bxf/ui/inspectors/StringButtonPropertyEditor.as $
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

	import mx.controls.Text;
	import mx.events.FlexEvent;

	public class StringButtonPropertyEditor extends PropertyEditorBase implements IPropertyEditor
	{
		private var mChangeNotify:ValueChangeNotifier;

		private var mLabel:mx.controls.Text;
		private var mVal:mx.controls.TextInput;
		private var mValStr:String;
		private var mTooltip:String;
		private	var mCmd:int;

		public function StringButtonPropertyEditor(inLabel:String, inPropName:String, inCmd:int, inToolTip:String):void
		{
			super(inLabel);
			mChangeNotify = new ValueChangeNotifier(inPropName, this);
			mCmd = inCmd;
			mTooltip = inToolTip;
		}

		override protected function createChildren():void
		{
			super.createChildren();
			if (mVal == null) {
				mVal = new mx.controls.TextInput();
				mVal.styleName = "HUDStringEditor";
				if (mTooltip != "") {
					mVal.toolTip = mTooltip;
				}
				addChild(mVal);

				mVal.editable = false;
				mVal.addEventListener(mx.events.FlexEvent.ENTER, onValueChanged);
				mVal.addEventListener( flash.events.MouseEvent.CLICK, onMouseClick);
				mVal.data = mValStr;
			}
		}

		override public function set enabled(value:Boolean):void {
			super.enabled = value;
			if (mVal != null) {
				mVal.enabled = value;
			}
		}

		public function setValueAsString(inValue:String, inProperty:String):void {
			mValStr = inValue;
			if (mVal)
				mVal.data = inValue;
		}

		public function setMultiValue(inValues:Array, inProperty:String):void {
			trace(this.className + ": Multivalue not supported yet.");
			setValueAsString(inValues[0], inProperty);
		}

		private function onValueChanged(evt:mx.events.FlexEvent):void {
			mChangeNotify.ValueCommitted(mVal.text);
 		}

		private function onMouseClick (mouseEvent: flash.events.MouseEvent):void {
		// sent event to host app -- this should really send command for flex app too, but can't figure out how to get toolbar controller
		// to just send command for flex app
			trace("send command: ", mCmd);
			//ExternalInterface.call(ExternalInterfaceConstants.cExecuteCommand, mCmd);
 		}
	}
}


