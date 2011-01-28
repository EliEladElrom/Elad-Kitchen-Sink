//========================================================================================
//  $File: //a3t/argon/branches/v1/1.0/dev/sdk/samples/flex/textLayout_ui/src/bxf/ui/inspectors/PropertyEditorBase.as $
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
	import com.adobe.bxf.ui.inspectors.IPropertyEditor;

	import mx.containers.HBox;
	import mx.controls.Spacer;
	import mx.controls.Text;
	import mx.core.ScrollPolicy;
	import flash.events.MouseEvent;
	import flash.ui.MouseCursor;
	import flash.events.Event;
	import mx.events.FlexEvent;
	import com.adobe.bxf.ui.controls.HotTextEvent;

	public class PropertyEditorBase extends HBox implements IHUDLayoutElement {
		private var mLabel:Text;
		private var mLabelText:String;
		private var mSpacer:Spacer;
		protected var mUseSectionSpacer:Boolean = false;
		private var mSectionSpacer:Spacer;

		public function PropertyEditorBase(inLabel:String) {
			if (null == (this as IPropertyEditor)) {
				throw new Error("ERROR: Class must be an IPropertyEditor");
			}

			setStyle("horizontalGap", 2);
			mLabelText = inLabel;
			this.horizontalScrollPolicy = this.verticalScrollPolicy = ScrollPolicy.OFF;

		//	addEventListener(HotTextEvent.FINISH_CHANGE, onCommit);
			addEventListener(PropertyEditEvent.VALUE_CHANGED, onValueCommit);
		}

		public function set sectionSpacer(inSectionSpacer:Boolean):void {
			mUseSectionSpacer = inSectionSpacer;
		}

		protected function get labelText():String {
			return mLabelText;
		}

		override protected function createChildren():void
		{
	        super.createChildren();
	        if (null == mSpacer) {
	        	mSpacer = new Spacer();
	        	addChild(mSpacer);
	        }

	        if (mUseSectionSpacer == true && null == mSectionSpacer)
	        {
	        	mSectionSpacer = new Spacer();
	        	addChild(mSectionSpacer);
	        }

	        if (null == mLabel) {
	        	mLabel = new Text();
	        	mLabel.text = mLabelText;
	        	mLabel.selectable = false;
				mLabel.styleName = "ActionLabels";
				mLabel.setStyle("textAlign", "right");
				mLabel.setStyle("paddingTop", 2);
	        	addChild(mLabel);
	        }

	    }

		public function getLabelWidth():int {
			var ret:int = 0;

			if (mUseSectionSpacer == false)
				ret = mLabel.measuredWidth;
			return ret;
		}

		public function set maxSiblingLabelWid(inMaxLblWid:int):void {
			var val:int = inMaxLblWid - getLabelWidth();
			if (val < 0)
				val = 0;

			if (mUseSectionSpacer)
				mSectionSpacer.width = val;
			else
				mSpacer.width = val;
		}

		protected function onValueCommit(event:Event):void
		{
			this.parentApplication.dispatchEvent(new Event(Event.ACTIVATE));
		}
	}
}