//========================================================================================
//  $File: //a3t/argon/branches/v1/1.0/dev/sdk/samples/flex/textLayout_ui/src/bxf/ui/inspectors/CheckboxPropertyEditor.as $
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

	import mx.containers.HBox;
	import mx.controls.CheckBox;
	import mx.controls.Spacer;

	public class CheckboxPropertyEditor extends PropertyEditorBase implements IPropertyEditor
	{
		private var mChangeNotify:ValueChangeNotifier;
		private var mSelected:Boolean;

		private var mCheckbox:CheckBox;
		private var mHangingIndent:Boolean;
		private var mAlternateLabel:String;		// valid if hanging indent trick mode is on

		public function CheckboxPropertyEditor(inLabel:String, inPropName:String, inHangingIndent:Boolean = false, inSectionLabel:String = " ")
		{
			super(inHangingIndent ? inSectionLabel : inLabel);
			setStyle("verticalAlign", "middle");

			mChangeNotify = new ValueChangeNotifier(inPropName, this);

			mHangingIndent = inHangingIndent;
			mAlternateLabel = inLabel;
		}

		override protected function createChildren():void
		{
			super.createChildren();
			if (mCheckbox == null) {

				mCheckbox = new CheckBox();

				if (!mHangingIndent)
				{
					addChild(mCheckbox);
				}
				else
				{
					mCheckbox.label = mAlternateLabel;
					var newHBox:HBox = new HBox();
					newHBox.setStyle("horizontalGap", 0);
					var s:Spacer = new Spacer();
					s.width = 4;
					newHBox.addChild(s);
					newHBox.addChild(mCheckbox);
					addChild(newHBox);
				}

				mCheckbox.selected = mSelected;
				mCheckbox.addEventListener(MouseEvent.CLICK, onMouseClick);
			}
		}

		public function onMouseClick(inEvt:MouseEvent):void {
			mChangeNotify.ValueCommitted(mCheckbox.selected ? "true" : "false");
		}

		public function setValueAsString(inValue:String, inProperty:String):void {
			mSelected = Boolean(inValue == "true");
			if (mCheckbox)
				mCheckbox.selected = mSelected;
		}

		public function setMultiValue(inValues:Array, inProperty:String):void {
			trace(this.className + ": Multivalue not supported yet.");
			setValueAsString(inValues[0], inProperty);
		}

	}
}


