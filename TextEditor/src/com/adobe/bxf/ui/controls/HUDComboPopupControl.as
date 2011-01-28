//========================================================================================
//  $File: //a3t/argon/branches/v1/1.0/dev/sdk/samples/flex/textLayout_ui/src/bxf/ui/controls/HUDComboPopupControl.as $
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
package com.adobe.bxf.ui.controls
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;

	import mx.controls.Label;

	public class HUDComboPopupControl extends HUDImagePopupControl {
		[Embed(source="../assets/icon_inspector_popup_arrows.png")]
		private var mListDropDownImg:Class;
		private var mNameLabel:Label;

		private var mValues:Array;
		private var mSelValue:String;

		private static const DROP_DOWN_BMP_OFFSET:Number = 1;

		public function HUDComboPopupControl(inValues:Array=null, inStyleName:String="ActionDetails") {
			super(mListDropDownImg, inValues, inStyleName);

			mValues = inValues;
			if (mValues)
				mSelValue = mValues[0];
			this.styleName = inStyleName;
			this.setStyle("horizontalGap", 1);
		}

		override public function set values(inArray:Array):void {
			super.values = inArray;

			mValues = inArray;
			mSelValue=mValues[0];
		}

		public function get value():String {
			return mSelValue;
		}

		public function set value(inVal:String):void {
			mSelValue = inVal;
			mNameLabel.text = mSelValue;
		}

		public function addValueItem(inItem:String):void {
			mValues.push(inItem);
			super.values = mValues;
		}

		override protected function createChildren():void
		{
	        super.createChildren();
			if (null == mNameLabel) {

				mNameLabel = new Label;
				mNameLabel.text = mSelValue;
				addChildAt(mNameLabel, 0);

				super.menuPositionOwner = mNameLabel;
				popupMenu.alignLeftMargin = true;
				this.addEventListener(BxPopupMenu.SELECTION_CHANGED, onItemSelected);
			}
		}

		protected function onItemSelected(evt:Event):void {
	   		if (super.selectedItem != null)
	   		{
	   			mSelValue = super.selectedItem as String;
				mNameLabel.text = mSelValue;
	   		}
	   	}

	   	override protected function updateDisplayList(unscaledWidth:Number,
            unscaledHeight:Number):void {

            super.updateDisplayList(unscaledWidth, unscaledHeight);
			if (mNameLabel.height > this.imageButton.height)
				this.imageButton.y = ((mNameLabel.height - this.imageButton.height)/2) - DROP_DOWN_BMP_OFFSET;
        }


	}
}