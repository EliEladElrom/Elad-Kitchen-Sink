//========================================================================================
//  $File: //a3t/argon/branches/v1/1.0/dev/sdk/samples/flex/textLayout_ui/src/bxf/ui/inspectors/HotNumericPropertyEditor.as $
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
	import com.adobe.bxf.ui.controls.HotTextEvent;
	import com.adobe.bxf.ui.controls.HotTextNumber;

	public class HotNumericPropertyEditor extends PropertyEditorBase implements IPropertyEditor
	{
		private var mChangeNotify:ValueChangeNotifier;
		private var mPropName:String;
		private var mVal:HotTextNumber;
		private var mMin:Number, mMax:Number;
		private var mDecimals:uint;
		private var mIncrement:Number;
		private var mValue:Number;
		private var mHotTextSuffix:String;
		private var mEnforcePrecision:Boolean;
		private var mMaxChars:int;	// for in place editing; bug 212147
		private var mConvertToPercent:Boolean;

		public function HotNumericPropertyEditor(inLabel:String, inPropName:String,
												inHotTextSuffix:String = null,
												inMin:Number = Number.NaN, inMax:Number = Number.NaN,
												inConvertToPercent:Boolean = false,
												inDecimals:uint = 0, inIncrement:Number = 1.0,
												inEnforcePrecision:Boolean = false, inMaxChars:int = 0)
		{
			super(inLabel);
			mMin = inMin;
			mMax = inMax;
			mDecimals = inDecimals;
			mIncrement = inIncrement;
			mEnforcePrecision = inEnforcePrecision;
			mMaxChars = inMaxChars;
			mHotTextSuffix = inHotTextSuffix;
			mConvertToPercent = inConvertToPercent;
			mPropName = inPropName;
			mChangeNotify = new ValueChangeNotifier(inPropName, this);
			this.tabChildren = true;
		}


		override protected function createChildren():void
		{
	        super.createChildren();

			if (null == mVal) {
				mVal = new HotTextNumber();
				mVal.width = 58;
				addChild(mVal);
				mVal.minValue = mMin;
				mVal.maxValue = mMax;
				mVal.decimalPlaces = mDecimals;
				mVal.increment = mIncrement;
				mVal.enforcePrecision = mEnforcePrecision;
				mVal.maxChars = mMaxChars;
				//mVal.hotTextColor = 0x909090;
				mVal.displayUnderline = true;

				if (mHotTextSuffix)
					mVal.suffix=mHotTextSuffix;
				//mVal.restrict = "0-9\\-";

				// add event listener for each function
				mVal.addEventListener(HotTextEvent.CHANGE, onNumberChanged);
				mVal.addEventListener(HotTextEvent.FINISH_CHANGE, onNumberChangeFinished);

				mVal.value = mValue;
			}
		}


		public function setValueAsString(inValue:String, inProperty:String):void {
			if (mConvertToPercent == true) {
				mValue = Math.ceil(Number(inValue)*100);
			}
			else mValue = Number(inValue);
			if (mVal)
				mVal.value = mValue;

		}

		public function setMultiValue(inValues:Array, inProperty:String):void {
			setValueAsString(inValues[0], inProperty);
			mVal.setValueConflict();
		}

		// allows live update, before committing with onNumberChangeFinished
		public function onNumberChanged(inEvt:HotTextEvent):void {
			if (mConvertToPercent == true) {
				mChangeNotify.ValueEdited(mVal.value/100);
			}
			else mChangeNotify.ValueEdited(mVal.value);
		}

		public function onNumberChangeFinished(inEvt:HotTextEvent):void {
			if (mConvertToPercent == true) {
				mChangeNotify.ValueCommitted(mVal.value/100);
			}
			else mChangeNotify.ValueCommitted(mVal.value);
		}
	}
}


