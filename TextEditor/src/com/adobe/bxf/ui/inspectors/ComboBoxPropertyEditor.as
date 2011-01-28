//========================================================================================
//  $File: //a3t/argon/branches/v1/1.0/dev/sdk/samples/flex/textLayout_ui/src/bxf/ui/inspectors/ComboBoxPropertyEditor.as $
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
	import flash.events.Event;

	import com.adobe.bxf.ui.controls.BxPopupMenu;
	import com.adobe.bxf.ui.controls.HUDComboPopupControl;

	public class ComboBoxPropertyEditor extends PropertyEditorBase implements IPropertyEditor
	{
		private var mChangeNotify:ValueChangeNotifier;
		private var mComboBox:HUDComboPopupControl;
		private var mComboBoxStyleName:String;
		private var mAvailVals:Array;
		private var mValueRemap:Object;
		private var mSelectedIdx:int = 0;
		private var mDeferredInitValue:String = null;

		public function ComboBoxPropertyEditor(inLabel:String, inPropName:String, inAvailVals:Array, inValueRemap:Object = null) {
			super(inLabel);

			mChangeNotify = new ValueChangeNotifier(inPropName, this);
			mComboBoxStyleName = "comboPropEditorValue";

			mAvailVals = inAvailVals;
			mValueRemap = (inValueRemap != null) ? inValueRemap : new Object();
		}

		override protected function createChildren():void
		{
			super.createChildren();
			if (mComboBox == null) {
				mComboBox = new HUDComboPopupControl(mAvailVals, mComboBoxStyleName);
				mComboBox.setStyle("paddingTop", 2);

				addChild(mComboBox);

				if (mDeferredInitValue != null && mDeferredInitValue != "")
				{
					mComboBox.value = mDeferredInitValue;
					mDeferredInitValue = null;
				}

				// Make sure the app knows that there is a value selected...
				else if (mAvailVals.length > 0)
				{
					var value:Object = mValueRemap[mComboBox.value];
					if (value == null)
						value = mComboBox.value;

					mChangeNotify.ValueCommitted(value);
				}

				mComboBox.addEventListener(BxPopupMenu.SELECTION_CHANGED, onComboChanged);
			}
		}

		private function onComboChanged(inEvt:Event):void {
			var value:Object = mValueRemap[mComboBox.value];
			if (value == null)
				value = mComboBox.value;

			mChangeNotify.ValueCommitted(value);
		}

		public function setValueAsString(inValue:String, inProperty:String):void {
			for (var userString:String in mValueRemap) {
				if (mValueRemap[userString] == inValue) {
					inValue = userString;
					break;
				}
			}

			if (mComboBox)
				mComboBox.value = inValue;
			else
				mDeferredInitValue = inValue;
		}


		public function setMultiValue(inValues:Array, inProperty:String):void {
			var value:String = "Mixed";
			if (mComboBox)
				mComboBox.value = value;
			else
				mDeferredInitValue = value;
		}
	}
}
