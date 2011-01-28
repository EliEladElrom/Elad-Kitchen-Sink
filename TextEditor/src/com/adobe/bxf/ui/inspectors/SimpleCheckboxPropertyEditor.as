//========================================================================================
//  $File: //a3t/argon/branches/v1/1.0/dev/sdk/samples/flex/textLayout_ui/src/bxf/ui/inspectors/SimpleCheckboxPropertyEditor.as $
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

	import mx.containers.Canvas;
	import mx.controls.CheckBox;

	/* The simple checkbox property editor keeps the label to the right of the
		control and doesn't partipate in any dynamic label sizing */
	public class SimpleCheckboxPropertyEditor extends Canvas implements IPropertyEditor
	{
		private var mChangeNotify:ValueChangeNotifier;

		//private var mLabel:mx.controls.Text;
		private var mCheckbox:CheckBox;

		public function SimpleCheckboxPropertyEditor(inLabel:String, inPropName:String)
		{
			super();

			mChangeNotify = new ValueChangeNotifier(inPropName, this);

			mCheckbox = new CheckBox();
			mCheckbox.label = inLabel;
			addChild(mCheckbox);

			mCheckbox.addEventListener(MouseEvent.CLICK, onMouseClick);
		}


		public function onMouseClick(inEvt:MouseEvent):void {
			mChangeNotify.ValueCommitted(mCheckbox.selected ? "true" : "false");
		}

		public function setValueAsString(inValue:String, inProperty:String):void {
			mCheckbox.selected = Boolean(inValue == "true");
		}

		public function setMultiValue(inValues:Array, inProperty:String):void {
			trace(this.className + ": Multivalue not supported yet.");
			setValueAsString(inValues[0], inProperty);
		}
	}
}


